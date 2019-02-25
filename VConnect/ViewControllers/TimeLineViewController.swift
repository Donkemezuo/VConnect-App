//
//  TimeLineViewController.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 2/8/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class TimeLineViewController: UIViewController {
    let timelineView = TimelineView()
    var barButton = UIBarButtonItem()
    var postVC = PostViewController()

   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor =  UIColor.yellow
        self.view.addSubview(timelineView)
     
        timelineView.collectionView.delegate = self
        timelineView.collectionView.dataSource = self
        UserPost()
       
        
    }
    
    
    
    
    private func UserPost() {
        
        timelineView.postButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    
    }
    
    @objc private func buttonPressed(){
        
        navigationController?.pushViewController(postVC, animated: true)
        
        
    }
    
    
    
}

extension TimeLineViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCell", for: indexPath) as? TimelineCollectionViewCell else {return UICollectionViewCell()}
        
        cell.textView.text = "We Made it here"
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius =  5.0
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let destination = TimelineDetailViewController()
        self.navigationController?.pushViewController(destination, animated: true)
        
    }
    
    
}
