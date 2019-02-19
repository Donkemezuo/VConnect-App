//
//  SignInView.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 2/9/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class SignInView: UIView {
    
    public lazy var profileImage:UIButton = {
        let image = UIButton()
        image.backgroundColor = .green
        image.setBackgroundImage(UIImage.init(named: "HoldHands"), for: .normal)
        image.layer.cornerRadius = image.frame.size.height/2
        image.clipsToBounds = true
        return image
    }()
    
    public lazy var image:UIImageView = {
            let image = UIImageView()
            image.image = UIImage.init(named: "logiin")
            return image
    }()
    
    public lazy var view:UIView = {
        let upperView = UIView()
            upperView.backgroundColor = .gray
        return upperView
    }()
    
    public lazy var settingButton: UIButton = {
        let setting = UIButton()
            setting.setImage(UIImage.init(named: "icons8-settings"), for: .normal)
        return setting
    }()
    
    public lazy var organizationName:UILabel = {
        let label = UILabel()
        label.text = "Organization Name"
        label.backgroundColor = .green
        label.layer.cornerRadius = 10.0
        return label
        
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
        
        addSubview(view)
        addSubview(profileImage)
        addSubview(organizationName)
        view.addSubview(image)
        view.addSubview(organizationName)
        view.addSubview(settingButton)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        image.translatesAutoresizingMaskIntoConstraints = false
        organizationName.translatesAutoresizingMaskIntoConstraints = false
        settingButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.topAnchor.constraint(equalTo: topAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -600).isActive = true
        image.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        image.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        image.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        image.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        settingButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        settingButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 360).isActive = true
        settingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        settingButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150).isActive = true
        
        profileImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 150).isActive = true
        profileImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        profileImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        profileImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2).isActive = true
        profileImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70).isActive = true
        profileImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70).isActive = true
        
        organizationName.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 2).isActive = true
        organizationName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70).isActive = true
        organizationName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70).isActive = true
        organizationName.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.03).isActive = true
        
        
  
}
}
