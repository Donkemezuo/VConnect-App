//
//  SignInView.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 2/9/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class SignInView: UIView {

    public lazy var profileView: UIView = {
        let profileView =  UIView()
        profileView.backgroundColor = #colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1).withAlphaComponent(0.9)
        return profileView
    }()
    
    public lazy var profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
        imageView.layer.cornerRadius = imageView.frame.size.width/2
        clipsToBounds = true
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    public lazy var organizationName: UILabel = {
        let label = UILabel()
        label.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.text = "The name of organization goes here"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()

    public lazy var adminName:UILabel = {
        let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 30)
            label.text = "Raymond"
            label.textAlignment =  .center
            label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return label
    }()
    
    public lazy var adminActivities: UILabel = {
        let button = UILabel()
            button.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        return button
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
        setupProfileView()
        setupProfileImage()
        setupOrganizationName()
        setAdminName()
        setActivityButton()
}
    private func setupProfileView(){
        addSubview(profileView)
        profileView.translatesAutoresizingMaskIntoConstraints = false
        profileView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        profileView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        profileView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        profileView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -360).isActive = true
    }
    private func setupProfileImage(){
        addSubview(profileImage)
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        
        profileImage.topAnchor.constraint(equalTo: profileView.topAnchor, constant: 150).isActive = true
    profileImage.leadingAnchor.constraint(equalTo: profileView.leadingAnchor, constant: 130).isActive = true
    profileImage.trailingAnchor.constraint(equalTo: profileView.trailingAnchor, constant: -130).isActive = true
    profileImage.bottomAnchor.constraint(equalTo: profileView.bottomAnchor, constant: -85).isActive = true
    }
    private func setupOrganizationName(){
        addSubview(organizationName)
        organizationName.translatesAutoresizingMaskIntoConstraints = false
        organizationName.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 2).isActive = true
        organizationName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50).isActive = true
        organizationName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50).isActive = true
        organizationName.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.03).isActive = true
    }

   private func setAdminName(){
    addSubview(adminName)
    adminName.translatesAutoresizingMaskIntoConstraints = false
    adminName.topAnchor.constraint(equalTo: organizationName.bottomAnchor).isActive = true
    adminName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
    adminName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30).isActive = true
    adminName.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.04).isActive = true
    
    }
    
    private func setActivityButton(){
        addSubview(adminActivities)
        adminActivities.translatesAutoresizingMaskIntoConstraints = false
        adminActivities.topAnchor.constraint(equalTo: adminName.bottomAnchor).isActive = true
        adminActivities.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        adminActivities.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        adminActivities.bottomAnchor.constraint(equalTo: profileView.bottomAnchor).isActive = true
        
    }
    
}
