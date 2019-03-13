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
    
    public lazy var organizationAddress: UITextView = {
        let address = UITextView()
        address.font = UIFont.init(name: "Georgia", size: 20)
            address.textAlignment = .left
            address.backgroundColor = UIColor.clear
            address.layer.cornerRadius = 5.0
            address.text = "Address: 1710 Popham avenue, Bronx, New York 10453"
            address.isEditable =  false
            address.dataDetectorTypes = [.address, .link, .phoneNumber]
            address.font = .boldSystemFont(ofSize: 20)
            address.isSelectable =  false
            address.isScrollEnabled = false
        
        return address
    }()
    
    public lazy var contactEmail: UITextView = {
        let email = UITextView()
        email.font = UIFont.init(name: "Georgia", size: 20)
            email.textAlignment = .left
            email.backgroundColor = UIColor.clear
            email.text = "Email: raymonddonkemezuo@pursuit.org"
            email.layer.cornerRadius = 5.0
            email.isEditable = false
            email.isSelectable = false
            email.dataDetectorTypes = [.link]
            email.isScrollEnabled = false
            email.font = .boldSystemFont(ofSize: 20)
        return email
        
    }()
    
    public lazy var contactPhoneNumber: UITextView = {
        let phoneNumber = UITextView()
            phoneNumber.font = UIFont.boldSystemFont(ofSize: 16)
            phoneNumber.textAlignment = .left
            phoneNumber.backgroundColor = UIColor.clear
            phoneNumber.dataDetectorTypes = .phoneNumber
            phoneNumber.text = "Phone Number: 3129376040"
            phoneNumber.font = UIFont.init(name: "Georgia", size: 20)
            phoneNumber.layer.cornerRadius = 5.0
            phoneNumber.isEditable =  false
            phoneNumber.isSelectable = false
            phoneNumber.isScrollEnabled = false
            phoneNumber.font = .boldSystemFont(ofSize: 20)
        return phoneNumber
        
    }()
    
    
    public lazy var organizationDescription:UITextView = {
        let description = UITextView()
        description.backgroundColor = UIColor.clear
        description.text = "Organization description and services offered goes here"
        description.font = UIFont.init(name: "Georgia", size: 20)
        description.layer.cornerRadius = 5.0
        description.isEditable = false
        //description.isSelectable = false
        //description.isScrollEnabled = false
        description.font = .boldSystemFont(ofSize: 20)
        return description
        
    }()
    
    public lazy var organizationWebsite:UITextView = {
        let website = UITextView()
        website.text = "website: www.website.com"
        website.backgroundColor = UIColor.clear
        website.layer.cornerRadius = 5.0
        website.font = UIFont.init(name: "Georgia", size: 20)
        website.isEditable = false
        website.dataDetectorTypes = .link
        website.isSelectable = false
        website.isScrollEnabled = false
        website.font = .boldSystemFont(ofSize: 20)
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
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -420).isActive = true
    
        organizationDescription.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5).isActive = true
        organizationDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        organizationDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        organizationDescription.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -330).isActive = true
        
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
