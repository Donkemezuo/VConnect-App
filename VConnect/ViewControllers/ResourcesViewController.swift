//
//  ResourcesViewController.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 2/8/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit
import FirebaseFirestore

class ResourcesViewController: UIViewController {
    
    let resourcesView = ResourcesView()
    
    let categories = ["Children and Women", "Youth Empowerment","Rape","Housing and Homelessness","Legal Aid", "Widow"]
    
    private var organizations = [Organization](){
      
        didSet {
            DispatchQueue.main.async {
                self.resourcesView.collectionView.reloadData()
            }
        }
    }
    
    private var organizationDict = [String: [Organization]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(resourcesView)
        resourcesView.collectionView.dataSource = self
        resourcesView.collectionView.delegate = self
        getOrganizationData()
        navigationItem.title = "Categories of Organizations"
         view.setGradientBackground(colorOne: UIColor.red.withAlphaComponent(0.7), colorTwo: UIColor.blue.withAlphaComponent(0.7), colorThree: UIColor.white.withAlphaComponent(0.7), colorFour: UIColor.brown.withAlphaComponent(0.7))
        //view.setColorGradients(view: resourcesView.collectionView)
    }
    
    private func getOrganizationData(){
        DatabaseManager.firebaseDataBase
            .collection(DataBaseKeys.organizationCollectionKey)
            .addSnapshotListener(includeMetadataChanges: true) { [weak self] (querySnapShot, error) in
            if let snapshot = querySnapShot {
                var organizations = [Organization]()
                for document in snapshot.documents {
                    let organization = Organization.init(dict: document.data())
                    print(organization.organizationCategory)
                    organizations.append(organization)
                    if var foundOrganizationArray = self?.organizationDict[organization.organizationCategory] {
                        foundOrganizationArray.append(organization)
                    } else {
                        self?.organizationDict[organization.organizationCategory] = [organization]
                    }
                }
                self?.organizations = organizations
               
            }
        }
    }
    
}

extension ResourcesViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ResourcesCell", for: indexPath) as? ResourcesCollectionViewCell else {return UICollectionViewCell()}
        let category = categories[indexPath.row]
        cell.label.text = category
        cell.label.numberOfLines = 0
        cell.layer.borderWidth = 1
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //let selectedCategory =  categories[indexPath.row]
        
//        if let organizationsInSelectedCategory = organizationDict[selectedCategory] {
//            let nextTableView = ResourcesTableViewController(organizationsInCategory:organizationsInSelectedCategory)
//
//            self.navigationController?.pushViewController(nextTableView, animated: true)
//        }
        
        let selectedCategory = categories[indexPath.row]
        let organizationsToSet = organizations.filter {$0.organizationCategory == selectedCategory}
        let nextTV = ResourcesTableViewController(organizationsInCategory: organizationsToSet)
        self.navigationController?.pushViewController(nextTV, animated: true)
        
        }
        
    }
    
    

