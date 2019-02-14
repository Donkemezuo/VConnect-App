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
    
    let tableView: UITableView = {
        let resourcesTableView = UITableView()
        resourcesTableView.backgroundColor = UIColor.green.withAlphaComponent(0.9)
    
        return resourcesTableView
    }()
    
    
    let search: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        searchBar.layer.cornerRadius = 5.0
        return searchBar
    }()
    
    
    let map:MKMapView = {
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
        addSubview(search)
        addSubview(map)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        search.translatesAutoresizingMaskIntoConstraints = false
        map.translatesAutoresizingMaskIntoConstraints = false
        
        search.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        search.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        search.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        
        map.topAnchor.constraint(equalTo: search.bottomAnchor).isActive = true
        map.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        map.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        map.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        
        tableView.topAnchor.constraint(equalTo: map.bottomAnchor, constant: 5).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        
        
        
        
  
}
}
