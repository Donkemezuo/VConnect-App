//
//  TimelineView.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 2/11/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class TimelineView: UIView {

      public lazy var postButton:UIButton = {
        let postButton = UIButton()
            postButton.setTitle("Write a post", for: .normal)
            postButton.backgroundColor = .white
            postButton.titleLabel?.textColor = .red
            postButton.layer.cornerRadius = 10.0
        
        return postButton
        
    }()

      public lazy var collectionView:UICollectionView = {
        let cellLayout = UICollectionViewFlowLayout()
        cellLayout.scrollDirection = .vertical
        cellLayout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        cellLayout.itemSize = CGSize.init(width: 400, height: 400)
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: cellLayout)
        collectionView.backgroundColor = UIColor.blue.withAlphaComponent(0.5)
        
        return collectionView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInt()
        self.collectionView.register(TimelineCollectionViewCell.self, forCellWithReuseIdentifier: "NewsCell")
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInt()
    }
    private func commonInt(){
        setConstrains()
    }
 
    
    private func  setConstrains(){
        addSubview(postButton)
        addSubview(collectionView)
        postButton.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        postButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 2).isActive = true
        postButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        postButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        postButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        collectionView.topAnchor.constraint(equalTo: postButton.bottomAnchor, constant: 2).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

}