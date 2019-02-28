//
//  OrganizationProfileViewController.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 2/8/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit
import FirebaseAuth

class AdminLoginViewController: UIViewController {
    let profilePage = LoginView()
    private var usersession: UserSession!

    override func viewDidLoad() {
        super.viewDidLoad()
         view.backgroundColor =  UIColor.green
        self.view.addSubview(profilePage)
        //createAccountClicked()
        profilePage.emailTextField.isEnabled = true
        profilePage.emailTextField.delegate = self
        profilePage.passwordTextField.delegate = self
        usersession = (UIApplication.shared.delegate as! AppDelegate).usersession
        usersession.userSessionAccountDelegate = self
        profilePage.delegate = self
    }
    
    
   
    }



extension AdminLoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}


extension AdminLoginViewController: LoginViewDelegate {
    func loginButtonPressed(_loginView: LoginView, accountState: AccountloginState) {
        let signedInAdmin = TabBarViewController(accountType: AccountType.admin)
        guard let userEmail = profilePage.emailTextField.text,
            let userPassword = profilePage.passwordTextField.text,
            !userPassword.isEmpty,
            !userEmail.isEmpty else {
                showAlert(title: "Missing Required Fields", message: "Email and password required")
                return
        }
        
        switch accountState {
        case .newAccount:
            usersession.createOrganization(email: userEmail, password: userPassword)
            present(signedInAdmin, animated: true)

        case .existingAccount:
            usersession.signInExistingUser(email: userEmail, password: userPassword)
            present(signedInAdmin, animated: true)
        }
    }
}

extension AdminLoginViewController: UserSessionAccountCreationDelegate{
    func didRecieveErrorCreatingAccount(_ userSession: UserSession, error: Error) {
        showAlert(title: "Error creating account", message: error.localizedDescription)
    }
    
    func didCreateAccount(_ userSession: UserSession, user: User) {
        if let email = user.email {
            showAlert(title: "Account Created", message: "Account Created using \(email)") { (alertController) in
                let okAction = UIAlertAction(title: "Ok", style: .default) { (alert) in
                }
                alertController.addAction(okAction)
                self.present(alertController, animated: true)
            }
            
        }
        
    }
    
}





