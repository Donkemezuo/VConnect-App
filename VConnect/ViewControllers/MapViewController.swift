//
//  MapViewController.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 3/5/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
 let locationMapView = LocationMapView()
let locationManager = CLLocationManager()
    private var geocoder = CLGeocoder()
    private var longPress: UILongPressGestureRecognizer!
    private var previousLocation:CLLocation!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(locationMapView)
        locationMapView.searchBar.delegate = self
        locationMapView.mapView.delegate = self
        locationManager.startUpdatingLocation()
        locationMapView.mapView.showsUserLocation = true
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        configureLongPress()
        previousLocation = getLocation(on: locationMapView.mapView)
        
    }
    
    private func configureLongPress(){
        longPress = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(gestureRecognizer:)))
        longPress.minimumPressDuration = 0.5
        locationMapView.mapView.addGestureRecognizer(longPress)
    }
    
    @objc private func handleLongPress(gestureRecognizer: UILongPressGestureRecognizer) {
        var isDone = false
        let point = gestureRecognizer.location(in: locationMapView.mapView)
        let coordinate = locationMapView.mapView.convert(point, toCoordinateFrom: locationMapView.mapView)
        if !isDone {
            switch gestureRecognizer.state {
            case .began:
                LatAndLongDataManager.coordinate.lat = coordinate.latitude
                LatAndLongDataManager.coordinate.long = coordinate.longitude
                isDone = true
            default:
                break
            }
        }
    }
    
    
    private func getLocation(on map: MKMapView) -> CLLocation {
        let latitude = locationMapView.mapView.centerCoordinate.latitude
        let longitude = locationMapView.mapView.centerCoordinate.longitude
        return CLLocation(latitude: latitude, longitude: longitude)
    }
    
}

extension MapViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        UIApplication.shared.beginIgnoringInteractionEvents()
        
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = UIActivityIndicatorView.Style.gray
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        
        self.view.addSubview(activityIndicator)
        
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = searchBar.text
        let activeSearch = MKLocalSearch(request: searchRequest)
        activeSearch.start { (response, error) in
            if let error = error {
               self.showAlert(title: "Error", message: error.localizedDescription)
            } else {
                if let response = response {
                    activityIndicator.stopAnimating()
                    UIApplication.shared.endIgnoringInteractionEvents()
                    let annotations = self.locationMapView.mapView.annotations
                    self.locationMapView.mapView.removeAnnotations(annotations)
                    let latitude = response.boundingRegion.center.latitude
                     let longitude = response.boundingRegion.center.longitude
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                    self.locationMapView.mapView.addAnnotation(annotation)
                    
                    let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
                    let regionInmeters = MKCoordinateRegion.init(center: coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
                    self.locationMapView.mapView.setRegion(regionInmeters, animated: true)
                }
            }
        }
    }
}

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let center = getLocation(on: mapView)
        guard center.distance(from: previousLocation) > 30 else {return}
        previousLocation = center
        geocoder.reverseGeocodeLocation(center) { [weak self](placemark, error) in
            guard let self = self else {return}
            if error != nil {
               return
            }
                guard let placemark = placemark?.first else {return}
            guard let streetNumber = placemark.subThoroughfare, let streetName = placemark.thoroughfare else {return}
            DispatchQueue.main.async {
                self.navigationItem.title = "\(streetNumber) \(streetName)"
            }
            }
        
        }
    }

