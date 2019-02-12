//
//  DetailView.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 2/11/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class DetailView: UIView {
    
    let imageView: UIImageView = {
        let organizationImageView = UIImageView()
        organizationImageView.backgroundColor = UIColor.brown.withAlphaComponent(0.3)
        organizationImageView.layer.cornerRadius = 10.0
        return organizationImageView
    }()
    
    let label: UILabel = {
        let organization = UILabel()
        organization.font = UIFont.boldSystemFont(ofSize: 20)
        organization.textAlignment = .center
        organization.textColor = .black
        organization.backgroundColor = UIColor.gray
        organization.layer.cornerRadius = 10.0
        return organization
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
    private func setConstrains(){
        addSubview(imageView)
        addSubview(label)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -500).isActive = true
        
        
        label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        
        
    }
    

}
