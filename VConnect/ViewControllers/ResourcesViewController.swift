//
//  ResourcesViewController.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 2/8/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class ResourcesViewController: UIViewController {
    
    let resourcesView = ResourcesView()
    
    let dummyArray = ["Yap","Kev","DM","Micheal","Greg","KK","Uber","Late","Wild","After","BB","Cutie","Company","Lord","We","Wining","Get","Help","When","You","Can","Else","You","Will","Die","Yes","I","Said","It","Kill","Mo","eee","rrr","yyy","rrr","qqq","uuu","ooo","mmm","sss","zzz","nnn","lll","iii"]
    
    private var organizations = [Organization](){
      
        didSet {
            
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor =  #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        self.view.addSubview(resourcesView)
        resourcesView.collectionView.dataSource = self
        resourcesView.collectionView.delegate = self
        getOrganizationData()
        
    }
    
    
    
    private func getOrganizationData(){
        DatabaseManager.firebaseDataBase.collection(DataBaseKeys.organizationCollectionKey).addSnapshotListener(includeMetadataChanges: true) { (querySnapShot, error) in
            if let snapshot = querySnapShot {
                var organizations = [Organization]()
                for document in snapshot.documents {
                    let organization = Organization.init(dict: document.data())
                    print(document.data())
                    organizations.append(organization)
                }
                self.organizations = organizations
                print("Found \(organizations.count) race reviews")
            }
        }
    }
    
}





extension ResourcesViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dummyArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ResourcesCell", for: indexPath) as? ResourcesCollectionViewCell else {return UICollectionViewCell()}
        let category = dummyArray[indexPath.row]
        cell.label.text = category
        cell.layer.borderWidth = 2
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCategory =  dummyArray[indexPath.row]
            let nextTableView = ResourcesTableViewController(name: selectedCategory)
        self.navigationController?.pushViewController(nextTableView, animated: true)
        }
        
    }
    
    

