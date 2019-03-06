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
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(locationMapView)
        locationMapView.searchBar.delegate = self
        locationMapView.mapView.delegate = self
        locationManager.startUpdatingLocation()
        locationMapView.mapView.showsUserLocation = true
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
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
                    let zoom = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
                    let region = MKCoordinateRegion.init(center: coordinate, span:zoom)
                    self.locationMapView.mapView.setRegion(region, animated: true)
                }
            }
        }
        
    }
    
}

extension MapViewController: MKMapViewDelegate {
    
    
    
}
