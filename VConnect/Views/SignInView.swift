//
//  SignInView.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 2/9/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class SignInView: UIView {

    let userNameTextField: UITextField = {
        let userName =  UITextField()
        userName.placeholder = "Enter username"
        userName.font = UIFont.boldSystemFont(ofSize: 20)
        userName.textColor = UIColor.black.withAlphaComponent(0.3)
        return userName
        
    }()
    
    
    let passwordTextField: UITextField = {
        let password =  UITextField()
        password.placeholder = "Enter username"
        password.font = UIFont.boldSystemFont(ofSize: 20)
        password.textColor = UIColor.black.withAlphaComponent(0.3)
        return password
        
    }()
    
    
    let signInButton: UIButton = {
        let SignIn =  UIButton()
        SignIn.setTitle("Sign In", for: .normal)
        SignIn.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        SignIn.addTarget(self, action: #selector(signInclicked), for: .touchUpInside)
        return SignIn
        
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
       
        print("Sign in page button clicked")
        
    }
    
    
    private func  setConstrains() {
        addSubview(userNameTextField)
        addSubview(passwordTextField)
        addSubview(signInButton)
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        
        userNameTextField.topAnchor.constraint(equalTo:safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        userNameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        userNameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30).isActive = true
        userNameTextField.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2).isActive = true
        
        
        passwordTextField.topAnchor.constraint(equalTo:userNameTextField.bottomAnchor, constant: 20).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30).isActive = true
        passwordTextField.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2).isActive = true
        
        signInButton.topAnchor.constraint(equalTo:passwordTextField.bottomAnchor, constant: 30).isActive = true
        signInButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        signInButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30).isActive = true
        signInButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2).isActive = true
        
        
    }
  
}
