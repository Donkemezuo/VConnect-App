//
//  ResourcesTableViewController.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 2/11/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class ResourcesTableViewController: UIViewController {
    
    let resourcesTableView = TableView()
    private var nameHolder: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(resourcesTableView)
        resourcesTableView.tableView.delegate = self
        resourcesTableView.tableView.dataSource = self
        view.backgroundColor = UIColor.brown.withAlphaComponent(0.9)

        // Do any additional setup after loading the view.
    }
    
    
    init(name: String){
        super.init(nibName: nil, bundle: nil)
        self.nameHolder = name
    }
    
    required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
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
        navigationItem.title = "Organizations in Abuja for homeless"
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
