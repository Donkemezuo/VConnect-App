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
    
    let emailTextField: UITextField = {
        let userEmail = UITextField()
            userEmail.placeholder = "  Email"
            userEmail.font = UIFont.boldSystemFont(ofSize: 20)
            userEmail.backgroundColor = .white
            userEmail.layer.cornerRadius = 5.0
        
        return userEmail
    }()
    
    let passwordTextField: UITextField = {
        let userPassword = UITextField()
            userPassword.placeholder = "  Password"
            userPassword.font = UIFont.boldSystemFont(ofSize: 20)
            userPassword.backgroundColor = .white
            userPassword.layer.cornerRadius = 5.0
        
        return userPassword
    }()
    let button: UIButton = {
        let signInButton = UIButton()
        signInButton.setTitle("Login", for: .normal)
        signInButton.backgroundColor = UIColor.red.withAlphaComponent(0.5)
        signInButton.layer.cornerRadius = 5.0
        signInButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        signInButton.addTarget(self, action: #selector(signInclicked), for: .touchUpInside)
        
        return signInButton
    }()
    
    let label: UILabel = {
        let userLabel = UILabel()
            userLabel.text = "New User?  Sign up"
            userLabel.textAlignment = .center
            userLabel.textColor = .white
            userLabel.backgroundColor = UIColor.red.withAlphaComponent(0.5)
            userLabel.layer.cornerRadius = 10.0
            userLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        return userLabel
        
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
        
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(button)
        addSubview(label)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.topAnchor.constraint(equalTo: topAnchor, constant: 195).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        emailTextField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -490).isActive = true
        
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        passwordTextField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -425).isActive = true
        
        
        button.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 15).isActive = true
        button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -360).isActive = true
        
        label.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 15).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -295).isActive = true
    
        
        
        
    }
    
}
