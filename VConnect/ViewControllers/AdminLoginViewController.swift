//
//  OrganizationProfileViewController.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 2/8/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit


enum AccountloginState {
    case newAccount
    case existingAccount
}


protocol LoginViewDelegate: AnyObject {
    func loginButtonPressed( _loginView: AdminLoginViewController, accountState: AccountloginState)
}

class AdminLoginViewController: UIViewController {
  
    public var delegate: LoginViewDelegate?
    
    let profilePage = LoginView()
    private var tapGesture: UITapGestureRecognizer!
    private var loginState = AccountloginState.newAccount

    override func viewDidLoad() {
        
        super.viewDidLoad()
         view.backgroundColor =  UIColor.green
        self.view.addSubview(profilePage)
        createAccountClicked()
        profilePage.emailTextField.delegate = self
        profilePage.passwordTextField.delegate = self
        registerKeyboardNotification()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        registerKeyboardNotification()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        unregisterKeyboardNotification()
    }
    deinit {
        
    }
    
    func createAccountClicked(){
        profilePage.newUser.isUserInteractionEnabled = true
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(gesture:)))
        profilePage.newUser.addGestureRecognizer(tapGesture)
        profilePage.loginButton.addTarget(self, action: #selector(signInButtonClicked), for: .touchUpInside)
        
    }
    
    @objc func handleTap(gesture: UITapGestureRecognizer){
        loginState = loginState == .newAccount ? .existingAccount : .newAccount
        switch loginState {
        case .newAccount:
            profilePage.loginButton.setTitle("Create", for: .normal)
            profilePage.newUser.text = "Log into your account"
        case .existingAccount:
            profilePage.loginButton.setTitle("Login", for: .normal)
            profilePage.newUser.text = "Don't have an account? Sign up"
        }
    }
    
    
    @objc func signInButtonClicked() {
        
        delegate?.loginButtonPressed(_loginView: self, accountState: loginState)
        
        guard let userEmail = profilePage.emailTextField.text, let userPassword = profilePage.passwordTextField.text,
            !userEmail.isEmpty,
            !userPassword.isEmpty else {
                showAlert(title: "Missing Required fields", message: "Password and Email required")
                return
        }
        
        // TODO:
        // Send the user login credentials for authentification
        // Send
        
        signedInViewController().modalPresentationStyle = .overFullScreen
        signedInViewController().modalTransitionStyle = .crossDissolve
        present(signedInViewController(), animated: true, completion: nil)
    }
    
    private func registerKeyboardNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(willShowKeyboard(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(willHideKeyboard(notification:)), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    private func unregisterKeyboardNotification(){
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func willShowKeyboard(notification: Notification){
        guard let info = notification.userInfo, let keyboardFrame = info["UIKeyboardFrameEndUserInfoKey"] as? CGRect else {return}
        
        profilePage.view.transform = CGAffineTransform.init(translationX: 0, y: -keyboardFrame.height/2)
    }
    
    @objc private func willHideKeyboard(notification: Notification){
        profilePage.view.transform = CGAffineTransform.identity
    }
}

extension AdminLoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        profilePage.emailTextField.resignFirstResponder()
        profilePage.passwordTextField.resignFirstResponder()
        return true
    }
}
