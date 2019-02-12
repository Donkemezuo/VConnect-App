//
//  ProfileView.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 2/9/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

protocol signInButtonDelegate {
    func signInButtonClicked()
}

class ProfileView: UIView {
    
    var delegate: signInButtonDelegate?
    
    let button: UIButton = {
        let signInButton = UIButton()
        signInButton.setTitle("Already a member of the VConnect support community? Sign in please....", for: .normal)
        signInButton.backgroundColor = UIColor.blue.withAlphaComponent(0.4)
        signInButton.titleLabel?.numberOfLines = 0
        signInButton.layer.cornerRadius = 10.0
        signInButton.addTarget(self, action: #selector(signInclicked), for: .touchUpInside)

        return signInButton
    }()
    
    let buttonTwo: UIButton = {
        let signUpButton = UIButton()
        signUpButton.setTitle("New organization or specialist? Sign up here ....", for: .normal)
        signUpButton.backgroundColor = UIColor.blue.withAlphaComponent(0.4)
        signUpButton.titleLabel?.numberOfLines = 0
        signUpButton.layer.cornerRadius = 10.0
        return signUpButton
        
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
    
    @objc private func signInclicked(){
        delegate?.signInButtonClicked()
        print("Sign in page button clicked")
        
    }
    
    
    private func  setConstrains() {
        
        addSubview(button)
        addSubview(buttonTwo)
        button.translatesAutoresizingMaskIntoConstraints = false
        buttonTwo.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -700).isActive = true
      
        buttonTwo.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20).isActive = true
        buttonTwo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        buttonTwo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        buttonTwo.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -630).isActive = true
        
        
        
        
    }
    
}
