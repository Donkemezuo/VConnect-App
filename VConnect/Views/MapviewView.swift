//
//  MapView.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 3/5/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit
import MapKit
class LocationMapView: UIView {

    public lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        
        return mapView
    }()
    
    public lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        return searchBar
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        SetConstrains()
    }
    
    
    private func  SetConstrains(){
        setupSearchBar()
        setupMap()
    }
    
    private func setupSearchBar(){
        addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        searchBar.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    private func setupMap(){
        addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: searchBar.bottomAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
}
