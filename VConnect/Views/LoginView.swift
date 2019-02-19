//
//  ProfileView.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 2/9/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit


class LoginView: UIView {
    
    
    
    public lazy var imageView: UIImageView = {
        let backgroundImageView = UIImageView()
        backgroundImageView.image = UIImage.init(named: "logiin")
        return backgroundImageView
        
    }()
    
    
    public lazy var view: UIView = {
        let loginCredentialsView = UIView()
        return loginCredentialsView
    }()
    
    
      public lazy var emailTextField: UITextField = {
        let userEmail = UITextField()
            userEmail.placeholder = "  Email"
            userEmail.font = UIFont.boldSystemFont(ofSize: 20)
            userEmail.backgroundColor = .white
            userEmail.layer.cornerRadius = 5.0
        
        return userEmail
    }()
    
      public lazy var passwordTextField: UITextField = {
        let userPassword = UITextField()
            userPassword.placeholder = "  Password"
            userPassword.font = UIFont.boldSystemFont(ofSize: 20)
            userPassword.backgroundColor = .white
            userPassword.layer.cornerRadius = 5.0
        
        return userPassword
    }()
      public lazy var loginButton: UIButton = {
        let login = UIButton()
        login.setTitle("Login", for: .normal)
        login.backgroundColor = UIColor.red.withAlphaComponent(0.5)
        login.layer.cornerRadius = 30.0
        login.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
     
        
        return login
    }()
    
      public lazy var newUser: UILabel = {
        let userLabel = UILabel()
            userLabel.text = "   Don't have an account? Sign up"
            userLabel.textAlignment = .center
            userLabel.textColor = .white
        
            userLabel.font = UIFont.boldSystemFont(ofSize: 18)
        
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
    
    
        
    
    private func  setConstrains() {
        
        addSubview(imageView)
        addSubview(view)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(newUser)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        newUser.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        view.topAnchor.constraint(equalTo: topAnchor, constant: 425).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        
        
        emailTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        emailTextField.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.95).isActive = true
        emailTextField.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05).isActive = true
        
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.95).isActive = true
        passwordTextField.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70).isActive = true
        loginButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.06).isActive = true
        
        newUser.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 5).isActive = true
        newUser.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        newUser.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        
        
        
        
        
        

        
        
    }
    
}
