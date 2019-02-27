//
//  ResourcesTableViewController.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 2/11/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit
import MapKit

class ResourcesTableViewController: UIViewController {
    
    let resourcesTableView = TableView()
    private var nameHolder: String!
    private var barbuttonItem: UIBarButtonItem!
     let dummyArray = ["Yap","Kev","DM","Micheal","Greg","KK","Uber","Late","Wild","After","BB","Cutie","Company","Lord","We","Wining","Get","Help","When","You","Can","Else","You","Will","Die","Yes","I","Said","It","Kill","Mo","eee","rrr","yyy","rrr","qqq","uuu","ooo","mmm","sss","zzz","nnn","lll","iii"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(resourcesTableView)
        resourcesTableView.tableView.delegate = self
        resourcesTableView.tableView.dataSource = self
        view.backgroundColor = UIColor.brown.withAlphaComponent(0.9)
    configureLongPress()
        setupShareButton()
    }
    private var longPress: UILongPressGestureRecognizer!
    private var annotations = [MKAnnotation]()
    
    
    
    
    init(name: String){
        super.init(nibName: nil, bundle: nil)
        self.nameHolder = name
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
        for name in dummyArray {
            let annotation = MKPointAnnotation()
            annotation.title = name
            annotations.append(annotation)
        }
        
        resourcesTableView.map.showAnnotations(annotations, animated: true)
    }
    
    
    @objc private func handleLongPress(gestureRecognizer: UILongPressGestureRecognizer){
        
        var isDone = false
       // let point = gestureRecognizer.location(in: resourcesTableView.map)
      //  let coordinate = resourcesTableView.map.convert(point, toCoordinateFrom: resourcesTableView.map)
        
        
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
        let activityVC = UIActivityViewController(activityItems: dummyArray, applicationActivities: nil)
        
        self.present(activityVC, animated: true, completion: nil)
        
    }
    
}

extension ResourcesTableViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ResourcesTableViewCell", for: indexPath) as? ResourcesTableViewCell else {return UITableViewCell()}
        cell.textLabel?.text = nameHolder
        cell.detailTextLabel?.text = "Children"
        cell.textLabel?.textAlignment = .center
        navigationItem.title = "Organization name"
        cell.backgroundColor = UIColor.brown.withAlphaComponent(0.7)
        return cell 
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailedVC = DetailViewController(name: nameHolder)
        self.navigationController?.pushViewController(detailedVC, animated: true)
    }
    
    
}
