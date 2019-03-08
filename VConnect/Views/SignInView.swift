//
//  SignInView.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 2/9/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit
@IBDesignable
class SignInView: UIView {
    public lazy var profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
        return imageView
    }()
    
    public lazy var organizationName: UILabel = {
        let label = UILabel()
        label.text = "Value re-orientation initiative"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    public lazy var adminName:UILabel = {
        let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 30)
            label.text = "Raymond Donkemezuo"
            label.textAlignment =  .center
            label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return label
    }()
    
    public lazy var about: UILabel = {
        let button = UILabel()
            button.text = "About"
            button.textAlignment = .left
            button.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1).withAlphaComponent(0.5)
            button.font = UIFont.italicSystemFont(ofSize: 20)
        return button
    }()
    
    public lazy var adminAddress: UILabel = {
        let address = UILabel()
        address.text = "Location: New York"
        address.textAlignment = .center
        address.font =  UIFont.boldSystemFont(ofSize: 14)
        return address
    }()
    
    public lazy var adminAbout: UITextView = {
        let about = UITextView()
        about.text = "Tell us about yourself"
        about.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        about.font = UIFont.boldSystemFont(ofSize: 15)
        return about
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profileImage.layer.cornerRadius = profileImage.bounds.width/2
        profileImage.layer.masksToBounds = true
        profileImage.clipsToBounds = true
    }
    
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
        setupProfileImage()
        setAdminName()
        setupOrganizationName()
        setupAdministratorsAddress()
        setupAboutLabel()
        setupAbout()
}
    
    private func setupProfileImage(){
        addSubview(profileImage)
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.topAnchor.constraint(equalTo: topAnchor, constant: 120).isActive = true
        profileImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 95).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 180).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 180).isActive = true
    }
    
   private func setAdminName(){
    addSubview(adminName)
    adminName.translatesAutoresizingMaskIntoConstraints = false
    adminName.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 2).isActive = true
    adminName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
    adminName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30).isActive = true
    adminName.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.04).isActive = true
    }
    
    private func setupOrganizationName(){
        addSubview(organizationName)
        organizationName.translatesAutoresizingMaskIntoConstraints = false
        organizationName.topAnchor.constraint(equalTo: adminName.bottomAnchor, constant: 2).isActive = true
        organizationName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50).isActive = true
        organizationName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50).isActive = true
        organizationName.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.03).isActive = true
    }
    
    private func setupAdministratorsAddress(){
        addSubview(adminAddress)
        adminAddress.translatesAutoresizingMaskIntoConstraints = false
        adminAddress.topAnchor.constraint(equalTo: organizationName.bottomAnchor).isActive = true
        adminAddress.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70).isActive = true
        adminAddress.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70).isActive = true
        adminAddress.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.03).isActive = true
    }
    
    private func setupAboutLabel(){
        addSubview(about)
        about.translatesAutoresizingMaskIntoConstraints = false
        about.topAnchor.constraint(equalTo: adminAddress.bottomAnchor, constant: 10).isActive = true
        about.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        about.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.03).isActive = true
        about.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4).isActive = true 
    }
    
    private func setupAbout(){
        addSubview(adminAbout)
        adminAbout.translatesAutoresizingMaskIntoConstraints = false
        adminAbout.topAnchor.constraint(equalTo: about.bottomAnchor).isActive = true
        adminAbout.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        adminAbout.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        adminAbout.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }
    
    
    
    
}
