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
        view.backgroundColor = #colorLiteral(red: 0.4778711929, green: 0.2743145844, blue: 0.2127175703, alpha: 1).withAlphaComponent(0.4)
        setBackgroundColor()
    }
    
    private func setBackgroundColor(){
        var gradient: CAGradientLayer!
        let firstColor = UIColor.init(red: 0/255, green: 34/255, blue: 62/255, alpha: 1.0)
        let secondColor = UIColor.init(red: 255/255, green: 161/255, blue: 127/255, alpha: 1.0)
        gradient = CAGradientLayer()
        gradient.colors = [firstColor.cgColor, secondColor.cgColor]
        gradient.frame = view.bounds
        view.layer.insertSublayer(gradient, at: 0)
        
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
        cell.backgroundColor = #colorLiteral(red: 0.4778711929, green: 0.2743145844, blue: 0.2127175703, alpha: 1).withAlphaComponent(0.5)
        cell.layer.borderWidth = 1
        cell.layer.borderColor = #colorLiteral(red: 0.4778711929, green: 0.2743145844, blue: 0.2127175703, alpha: 1)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCategory = categories[indexPath.row]
        let organizationsToSet = organizations.filter {$0.organizationCategory == selectedCategory}
        let nextTV = ResourcesTableViewController(organizationsInCategory: organizationsToSet)
        self.navigationController?.pushViewController(nextTV, animated: true)
        
        }
        
    }
    
    

