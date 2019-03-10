//
//  TimelineView.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 2/11/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class TimelineView: UIView {

      public lazy var postButton:UILabel = {
        let postButton = UILabel()
            postButton.text = "Write a post"
            postButton.backgroundColor = .white
            postButton.textColor = .gray
            postButton.textAlignment = .center
            postButton.layer.cornerRadius = 10.0
        
        return postButton
        
    }()

      public lazy var collectionView:UICollectionView = {
        let cellLayout = UICollectionViewFlowLayout()
        cellLayout.scrollDirection = .vertical
        cellLayout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        cellLayout.itemSize = CGSize.init(width: 400, height: 400)
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: cellLayout)
            collectionView.backgroundColor = UIColor.white
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
        setPostButton()
        setCollectionView()
    }
    private func setCollectionView(){
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: postButton.bottomAnchor, constant: 0).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    private func setPostButton(){
         addSubview(postButton)
         postButton.translatesAutoresizingMaskIntoConstraints = false
        postButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 2).isActive = true
        postButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        postButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        postButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }

}
