//
//  ResourcesView.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 2/8/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class ResourcesView: UIView {
    
        let collectionView: UICollectionView = {
    
        let cellLayout = UICollectionViewFlowLayout()
        cellLayout.scrollDirection = .vertical
        cellLayout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        cellLayout.itemSize = CGSize.init(width: 180, height: 200)
        let resourcesCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: cellLayout)
        resourcesCollectionView.backgroundColor = UIColor.red.withAlphaComponent(0.2)
        return resourcesCollectionView
    }()
   
        override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInt()
        self.collectionView.register(ResourcesCollectionViewCell.self, forCellWithReuseIdentifier: "ResourcesCell")
    }
    
        required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInt()
    }
        private func commonInt(){
        setConstrains()
    }
        private func setConstrains(){
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo:topAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
    }
    
}
