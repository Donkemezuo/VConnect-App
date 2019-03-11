//
//  DetailView.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 2/11/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class DetailView: UIView {
    
    public lazy var imageView: UIImageView = {
        let organizationImageView = UIImageView()
        organizationImageView.backgroundColor = UIColor.brown.withAlphaComponent(0.3)
        organizationImageView.layer.cornerRadius = 10.0
        return organizationImageView
    }()
    
    public lazy var organizationAddress: UILabel = {
        let address = UILabel()
          // address.font = UIFont.boldSystemFont(ofSize: 14)
        address.font = UIFont.init(name: "Georgia", size: 16)
            address.textAlignment = .left
            address.backgroundColor = UIColor.clear
            //address.dataDetectorTypes = .address
            address.layer.cornerRadius = 5.0
            address.numberOfLines = 0
            address.text = "Address: 1710 Popham avenue, Bronx, New York 10453"
        
        return address
    }()
    
    public lazy var contactEmail: UILabel = {
        let email = UILabel()
           // email.font = UIFont.boldSystemFont(ofSize: 14)
        email.font = UIFont.init(name: "Georgia", size: 16)
            email.textAlignment = .left
            email.backgroundColor = UIColor.clear
           // email.dataDetectorTypes = .all
            email.text = "Email: raymonddonkemezuo@pursuit.org"
            email.layer.cornerRadius = 5.0
            email.numberOfLines = 0
        return email
        
    }()
    
    public lazy var contactPhoneNumber: UILabel = {
        let phoneNumber = UILabel()
            phoneNumber.font = UIFont.boldSystemFont(ofSize: 16)
            phoneNumber.textAlignment = .left
            phoneNumber.backgroundColor = UIColor.clear
           // phoneNumber.dataDetectorTypes = .phoneNumber
            phoneNumber.text = "Phone Number: 3129376040"
        phoneNumber.font = UIFont.init(name: "Georgia", size: 16)
            phoneNumber.layer.cornerRadius = 5.0
            phoneNumber.numberOfLines = 0
        return phoneNumber
        
    }()
    
    
    public lazy var organizationDescription:UILabel = {
        let description = UILabel()
        description.backgroundColor = UIColor.clear
       // description.font = UIFont.boldSystemFont(ofSize: 14)
        description.text = "Organization description and services offered goes here"
        description.font = UIFont.init(name: "Georgia", size: 16)
        description.layer.cornerRadius = 5.0
        description.numberOfLines = 0
        return description
        
    }()
    
    public lazy var organizationWebsite:UILabel = {
        let website = UILabel()
        website.text = "website: www.website.com"
        website.backgroundColor = UIColor.clear
        website.layer.cornerRadius = 5.0
        //website.font = UIFont.boldSystemFont(ofSize: 14)
        website.font = UIFont.init(name: "Georgia", size: 16)
        website.numberOfLines = 0
        return website
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
        addSubview(organizationDescription)
        addSubview(organizationAddress)
        addSubview(contactPhoneNumber)
        addSubview(contactEmail)
        addSubview(organizationWebsite)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        organizationDescription.translatesAutoresizingMaskIntoConstraints = false
        organizationAddress.translatesAutoresizingMaskIntoConstraints = false
        contactPhoneNumber.translatesAutoresizingMaskIntoConstraints = false
        contactEmail.translatesAutoresizingMaskIntoConstraints = false
        organizationWebsite.translatesAutoresizingMaskIntoConstraints = false
        
        
        imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -460).isActive = true
    
        organizationDescription.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5).isActive = true
        organizationDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        organizationDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        organizationDescription.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -300).isActive = true
        
        organizationAddress.topAnchor.constraint(equalTo: organizationDescription.bottomAnchor, constant: 5).isActive = true
        organizationAddress.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        organizationAddress.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        organizationAddress.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -220).isActive = true
        
        contactPhoneNumber.topAnchor.constraint(equalTo: organizationAddress.bottomAnchor, constant: 5).isActive = true
        contactPhoneNumber.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        contactPhoneNumber.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        contactPhoneNumber.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -180).isActive = true
        
        contactEmail.topAnchor.constraint(equalTo: contactPhoneNumber.bottomAnchor, constant: 5).isActive = true
        contactEmail.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        contactEmail.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        contactEmail.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -140).isActive = true
        
        organizationWebsite.topAnchor.constraint(equalTo: contactEmail.bottomAnchor, constant: 5).isActive = true
        organizationWebsite.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        organizationWebsite.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        organizationWebsite.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100).isActive = true
        
    }
    

}
