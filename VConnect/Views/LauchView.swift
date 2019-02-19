//
//  LauchView.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 2/15/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class LauchView: UIView {
    
    public lazy var imageView: UIImageView = {
        let imageView = UIImageView()
            imageView.image = UIImage.init(named: "iPhone 8")
        return imageView
        
    }()
    
    public lazy var addminButton:UILabel = {
        let addminButton = UILabel()
        addminButton.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        addminButton.text = "Admin"
        addminButton.textAlignment = .center
        addminButton.textColor = .blue
        addminButton.layer.cornerRadius = 30.0
        addminButton.font = UIFont.boldSystemFont(ofSize: 20)
        return addminButton
        
    }()
    
    public lazy var exploreButton: UILabel = {
        let exploreButton = UILabel()
        exploreButton.text = "Explore"
        exploreButton.textAlignment = .center
        exploreButton.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        exploreButton.textColor = .red
        exploreButton.layer.cornerRadius = 30.0
        exploreButton.font = UIFont.boldSystemFont(ofSize: 20)
        
       return exploreButton
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInt()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInt()
    }
    private func commonInt(){
        setConstrains()
    }
    
    private func  setConstrains() {
        addSubview(imageView)
        addSubview(addminButton)
        addSubview(exploreButton)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addminButton.translatesAutoresizingMaskIntoConstraints = false
        exploreButton.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.topAnchor.constraint(equalTo:topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo:bottomAnchor).isActive = true
        
        addminButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        addminButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        addminButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 90).isActive = true
        addminButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -90).isActive = true
        addminButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05).isActive = true
        
        exploreButton.topAnchor.constraint(equalTo: addminButton.bottomAnchor, constant: 20).isActive = true
        exploreButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 90).isActive = true
        exploreButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -90).isActive = true
         exploreButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05).isActive = true
       
        
    }

}
