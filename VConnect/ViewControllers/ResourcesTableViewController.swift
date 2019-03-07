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
    private var coordinateToSearch = CLLocationCoordinate2D(latitude: 9.072264, longitude: 7.491302)
    private var geocoder = CLGeocoder()
    private var annotations = [MKAnnotation]()
    
    private var organizations = [Organization]() {
        didSet {
            DispatchQueue.main.async {
                self.makeAnnotations()
                self.resourcesTableView.tableView.reloadData()
            }
        }
    }
    
    private var myCurrentRegion = MKCoordinateRegion()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(resourcesTableView)
        resourcesTableView.tableView.delegate = self
        resourcesTableView.tableView.dataSource = self
        resourcesTableView.map.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        resourcesTableView.map.showsUserLocation = true
        view.setGradientBackground(colorOne: UIColor.red.withAlphaComponent(0.7), colorTwo: UIColor.blue.withAlphaComponent(0.7), colorThree: UIColor.white.withAlphaComponent(0.7), colorFour: UIColor.brown.withAlphaComponent(0.7))
        configureLongPress()
        setupShareButton()
        makeAnnotations()
    }
    
    private var longPress: UILongPressGestureRecognizer!
  
    init(organizationsInCategory: [Organization]){
        super.init(nibName: nil, bundle: nil)
        self.organizations = organizationsInCategory
    }
    
    required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
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
            
            annotation.title = organization.organizationName
            geocoder.geocodeAddressString(organization.organizationCity) { (placemarks, error) in
                if let error = error {
                    self.showAlert(title: "Error", message: error.localizedDescription)
                } else {
                    if let placemark = placemarks?.first {
                        let lat = placemark.location?.coordinate.latitude
                        let long = placemark.location?.coordinate.longitude
        
                    annotation.coordinate = CLLocationCoordinate2D(latitude: lat ?? 0.0, longitude: long ?? 0.0)
                    }
                }
            }
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
        return organizations.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ResourcesTableViewCell", for: indexPath) as? ResourcesTableViewCell else {return UITableViewCell()}
        cell.textLabel?.text = organizations[indexPath.row].organizationName
        cell.textLabel?.textAlignment = .center
        navigationItem.title = organizations[indexPath.row].organizationCategory
        cell.backgroundColor = UIColor.brown.withAlphaComponent(0.7)
        return cell 
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let organization = organizations[indexPath.row]
        let detailedVC = DetailViewController(name: organization)
        self.navigationController?.pushViewController(detailedVC, animated: true)
    }
}
extension ResourcesTableViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            coordinateToSearch = myCurrentRegion.center
        }
        let currentRegion = MKCoordinateRegion(center: coordinateToSearch, latitudinalMeters: 500, longitudinalMeters: 500)
        resourcesTableView.map.setRegion(currentRegion, animated: true)
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        myCurrentRegion = MKCoordinateRegion()
        if let currentLocation = locations.last {
            myCurrentRegion = MKCoordinateRegion(center: currentLocation.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        } else {
            myCurrentRegion = MKCoordinateRegion(center: coordinateToSearch, latitudinalMeters: 500, longitudinalMeters: 500)
        }
    }
}

extension ResourcesTableViewController:MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {return nil}
        var annotationView = resourcesTableView.map.dequeueReusableAnnotationView(withIdentifier: "MapView") as? MKMarkerAnnotationView
        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "MapView")
            annotationView?.canShowCallout = true
            annotationView?.rightCalloutAccessoryView = UIButton(type: .infoLight)
        } else {
            annotationView?.annotation = annotation
        }
        return annotationView
    }
}
