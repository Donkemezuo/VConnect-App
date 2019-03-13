//
//  ResourcesTableViewController.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 2/11/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit
import MapKit
import FirebaseFirestore

class ResourcesTableViewController: UIViewController {
    
    let resourcesTableView = TableView()
    private var barbuttonItem: UIBarButtonItem!
    private var locationManager = CLLocationManager()
    private var geocoder = CLGeocoder()
    private var annotations = [MKAnnotation]()
    private var longPress: UILongPressGestureRecognizer!
    private var defaultCoordinate = CLLocationCoordinate2DMake(9.0765, 7.3986)
    private var directionsArray = [MKDirections]()
    private var isSearching = false
    private var startLocation = CLLocationCoordinate2D()
    private var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView()
    private var organizations = [Organization]() {
        didSet {
            DispatchQueue.main.async {
                self.makeAnnotations()
                self.resourcesTableView.tableView.reloadData()
            }
        }
    }
    
    private var userSearchOrganizations = [Organization](){
        didSet {
            DispatchQueue.main.async {
                self.makeAnnotations()
                self.resourcesTableView.tableView.reloadData()
            }
        }
    }
    
    
    private var myCurrentRegion = MKCoordinateRegion()
   
    private func startLoading(){
        activityIndicator.center = resourcesTableView.map.center
        activityIndicator.hidesWhenStopped =  true
        activityIndicator.style = UIActivityIndicatorView.Style.gray
        resourcesTableView.map.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(resourcesTableView)
        resourcesTableView.tableView.delegate = self
        resourcesTableView.tableView.dataSource = self
        resourcesTableView.map.delegate = self
        resourcesTableView.map.showsUserLocation = true
        resourcesTableView.organizationSearchBar.delegate = self
        configureLongPress()
        setupShareButton()
        makeAnnotations()
        view.backgroundColor = #colorLiteral(red: 0.4778711929, green: 0.2743145844, blue: 0.2127175703, alpha: 1).withAlphaComponent(0.4)
        checkLocationServices()
//        getDirection()
        setupLocationManager()
        setDirections()
       // startLoading()
        
    }
    
    private func setbackgroundColor(){
        var gradient: CAGradientLayer!
        let firstColor = UIColor.init(red: 0/255, green: 34/255, blue: 62/255, alpha: 1.0)
        let secondColor = UIColor.init(red: 255/255, green: 161/255, blue: 127/255, alpha: 1.0)
        gradient = CAGradientLayer()
        gradient.colors = [firstColor.cgColor, secondColor.cgColor]
        gradient.frame = view.bounds
        view.layer.insertSublayer(gradient, at: 0)
    }
  
    init(organizationsInCategory: [Organization]){
        super.init(nibName: nil, bundle: nil)
        self.organizations = organizationsInCategory
    }
    
    required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
    }
    
    private func locationAuthorizationStatus(){
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            resourcesTableView.map.showsUserLocation = true
            break
        case .denied:
            showAlert(title: "Cancel", message: "Please authorize location access") { (alert) in
                //
            }
        case .authorizedAlways:
            break
        case .restricted:
            showAlert(title: "Cancel", message: "Please authorize location access") { (alert) in
                //
            }
        case .notDetermined:
            showAlert(title: "Cancel", message: "Please authorize location access") { (alert) in
                self.locationManager.requestAlwaysAuthorization()
            }
        }
    }
    
    private func setupLocationManager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    
    private func checkLocationServices(){
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            locationAuthorizationStatus()
        } else {
            showAlert(title: "Needed", message: "Please Authorize location services")
        }
    }
    
    private func getLocation(on map: MKMapView) -> CLLocation {
        let latitude = resourcesTableView.map.centerCoordinate.latitude
       
        let longitude = resourcesTableView.map.centerCoordinate.longitude
        return CLLocation(latitude: latitude, longitude: longitude)
    }
    
    private func createDirectionsRequest(from coordinate: CLLocationCoordinate2D) -> MKDirections.Request {
        let destinationCoordination = getLocation(on: resourcesTableView.map).coordinate
        let startingLocation = MKPlacemark(coordinate: coordinate)
        let destination = MKPlacemark(coordinate: destinationCoordination)
        
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: startingLocation)
        request.destination = MKMapItem(placemark: destination)
        request.transportType = .automobile
        request.requestsAlternateRoutes = true
        return request
    }
    
    private func setDirections(){
            startLocation = locationManager.location?.coordinate ?? defaultCoordinate
        
        let destination = resourcesTableView.map.centerCoordinate
        let startingPointPlaceMark = MKPlacemark(coordinate: startLocation)
        let destinationPlaceMark = MKPlacemark(coordinate: destination)
        let directionRequest = MKDirections.Request()
        directionRequest.source = MKMapItem(placemark: startingPointPlaceMark)
        directionRequest.destination =  MKMapItem(placemark: destinationPlaceMark)
        directionRequest.transportType = .automobile
        directionRequest.requestsAlternateRoutes =  true
        let detailedDirections = MKDirections(request: directionRequest)
        detailedDirections.calculate { (response, error) in
            guard let directionsResponse = response else {return}
            let route = directionsResponse.routes[0]
            self.resourcesTableView.map.addOverlay(route.polyline, level: .aboveRoads)
            let rect = route.polyline.boundingMapRect
            self.resourcesTableView.map.setVisibleMapRect(rect, animated: true)
        }
        
    }

    
    private func getDirection(){
        guard let location = locationManager.location?.coordinate else {
            showAlert(title: "Location Access needed", message: "Please Authorize location services")
            print("location here")
            return
        }
        let request = createDirectionsRequest(from: location)
        let directions = MKDirections(request: request)
        resetMapView(withNew: directions)
        
        directions.calculate { [weak self](response, error) in
            guard let response = response else {return}
            
            for route in response.routes {
                self?.resourcesTableView.map.addOverlay(route.polyline)
                self?.resourcesTableView.map.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
            }
            
        }
        resourcesTableView.map.reloadInputViews()
    }
    private func resetMapView(withNew directions: MKDirections) {
         resourcesTableView.map.removeOverlays(resourcesTableView.map.overlays)
        directionsArray.append(directions)
        _ = directionsArray.map {$0.cancel()}

    }
  
    private func configureLongPress(){
        longPress = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(gestureRecognizer:)))
        longPress.minimumPressDuration = 0.5
        resourcesTableView.map.addGestureRecognizer(longPress)
    }
   
    private func makeAnnotations(){
        resourcesTableView.map.removeAnnotations(annotations)
        for organization in organizations {
            let annotation = MKPointAnnotation()
            guard let lat = organization.lat, let long = organization.long else {return}
            if lat.isZero == true || long.isZero == true {
                annotation.coordinate = defaultCoordinate
            } else {
                annotation.coordinate = CLLocationCoordinate2DMake(lat, long)

            }
            annotation.title = organization.organizationName
            annotations.append(annotation)
        
        }
        resourcesTableView.map.showAnnotations(annotations, animated: true)
    }
    
    @objc private func handleLongPress(gestureRecognizer: UILongPressGestureRecognizer){
        var isDone = false
        let point = gestureRecognizer.location(in: resourcesTableView.map)
        let coordinate = resourcesTableView.map.convert(point, toCoordinateFrom: resourcesTableView.map)
        print(coordinate)
        if !isDone {
            switch gestureRecognizer.state {
            case .began:
                
                isDone = true
            default:
                break
            }
        }
    }
    
    private func setupShareButton(){
    barbuttonItem = UIBarButtonItem.init(title: "Share", style: .plain, target: self, action: #selector(shareButtonPressed))
    navigationItem.rightBarButtonItem =  barbuttonItem
    }
    @objc private func shareButtonPressed(){
        let activityVC = UIActivityViewController(activityItems: organizations, applicationActivities: nil)
        self.present(activityVC, animated: true, completion: nil)
    }
}

extension ResourcesTableViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearching ? userSearchOrganizations.count : organizations.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ResourcesTableViewCell", for: indexPath) as? ResourcesTableViewCell else {return UITableViewCell()}
        
        let organizationToSet = isSearching ? userSearchOrganizations[indexPath.row] : organizations[indexPath.row]
        
        cell.textLabel?.text = organizationToSet.organizationName
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.font = UIFont(name: "Georgia-Bold", size: 20)
        cell.textLabel?.numberOfLines = 0
        navigationItem.title = organizationToSet.organizationCategory
        cell.backgroundColor = #colorLiteral(red: 0.4778711929, green: 0.2743145844, blue: 0.2127175703, alpha: 1).withAlphaComponent(0.5)
        cell.layer.borderWidth = 1
        cell.layer.borderColor = #colorLiteral(red: 0.4778711929, green: 0.2743145844, blue: 0.2127175703, alpha: 1)
        return cell 
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let organization = isSearching ? userSearchOrganizations[indexPath.row] : organizations[indexPath.row]
        let detailedVC = DetailViewController(organizationDetails: organization)
        self.navigationController?.pushViewController(detailedVC, animated: true)
    }
}

extension ResourcesTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        isSearching = true
        resourcesTableView.organizationSearchBar.resignFirstResponder()
        userSearchOrganizations = organizations.filter{$0.organizationCity == resourcesTableView.organizationSearchBar.text}
        resourcesTableView.tableView.reloadData()
        if resourcesTableView.organizationSearchBar.text == "" {
            isSearching = false
            resourcesTableView.tableView.reloadData()
        }
    }
}

extension ResourcesTableViewController: CLLocationManagerDelegate {
    
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        if status == .authorizedWhenInUse {
//            coordinateToSearch = myCurrentRegion.center
//        }
//        let currentRegion = MKCoordinateRegion(center: coordinateToSearch, latitudinalMeters: 500, longitudinalMeters: 500)
//        resourcesTableView.map.setRegion(currentRegion, animated: true)
//    }
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        myCurrentRegion = MKCoordinateRegion()
//        if let currentLocation = locations.last {
//            myCurrentRegion = MKCoordinateRegion(center: currentLocation.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
//        } else {
//            myCurrentRegion = MKCoordinateRegion(center: coordinateToSearch, latitudinalMeters: 500, longitudinalMeters: 500)
//        }
//    }
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//
//    }
    
}

extension ResourcesTableViewController:MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolygonRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.yellow.withAlphaComponent(0.2)
        renderer.lineWidth = 4.0
        return renderer
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {return nil}
        
        var annotationView = resourcesTableView.map.dequeueReusableAnnotationView(withIdentifier: "Callouts") as? MKMarkerAnnotationView
        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "Callouts")
            annotationView?.canShowCallout = true
            annotationView?.rightCalloutAccessoryView = UIButton(type: .infoLight)
        } else {
            annotationView?.annotation = annotation
        }
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let calloutClicked = view.annotation else {return}
        

        //print(view.annotation)
//        if let organization = calloutClicked.title, let _ = (userSearchOrganizations.filter {$0.organizationName == organization}).first {
//            print("Callout button pressed")
//               getDirection()
//        }
//        if let organization = calloutClicked.subtitle, let _ = (userSearchOrganizations.filter {$0.organizationCity == organization}).first {
//            self.getDirection()
//        }
        getDirection()
        
        

        

    }
    
    
    
    
}
