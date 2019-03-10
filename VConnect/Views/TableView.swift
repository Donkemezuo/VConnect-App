//
//  TableView.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 2/11/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit
import MapKit

class TableView: UIView {
    
      public lazy var tableView: UITableView = {
        let resourcesTableView = UITableView()
            resourcesTableView.layer.cornerRadius = 5.0
            resourcesTableView.backgroundColor = .white
        return resourcesTableView
    }()
    
    
      public lazy var organizationSearchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        searchBar.layer.cornerRadius = 5.0
        searchBar.placeholder = "Enter a prefered city name"
        return searchBar
    }()
    
    
      public lazy var map:MKMapView = {
        let mapView = MKMapView()
            mapView.layer.cornerRadius = 4.0
        return mapView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInt()
        self.tableView.register(ResourcesTableViewCell.self, forCellReuseIdentifier: "ResourcesTableViewCell")
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInt()
    }
    private func commonInt(){
        setConstrains()
    }
    
    private func setConstrains(){
        addSubview(tableView)
        addSubview(organizationSearchBar)
        addSubview(map)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        organizationSearchBar.translatesAutoresizingMaskIntoConstraints = false
        map.translatesAutoresizingMaskIntoConstraints = false
        
        organizationSearchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        organizationSearchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        organizationSearchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        
        map.topAnchor.constraint(equalTo: organizationSearchBar.bottomAnchor).isActive = true
        map.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        map.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        map.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4).isActive = true
        
        tableView.topAnchor.constraint(equalTo: map.bottomAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        
        
        
        
  
}
}
