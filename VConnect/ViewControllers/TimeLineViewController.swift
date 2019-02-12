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

   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor =  UIColor.yellow.withAlphaComponent(0.2)
        self.view.addSubview(timelineView)
        setupNavigationBarItem()
        timelineView.collectionView.delegate = self
        timelineView.collectionView.dataSource = self
       
        
        // Do any additional setup after loading the view.
    }
    
    private func setupNavigationBarItem(){
       barButton = UIBarButtonItem.init(barButtonSystemItem: .camera, target: self, action: #selector(cameraButtonPressed))
        navigationItem.rightBarButtonItem = barButton
        
    }
    
    
    @objc func cameraButtonPressed(){
        
    }
    
    
}

extension TimeLineViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCell", for: indexPath) as? TimelineCollectionViewCell else {return UICollectionViewCell()}
        
        cell.textView.text = "We Made it here"
        
        return cell
    }
    
    
}
