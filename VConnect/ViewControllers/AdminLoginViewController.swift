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
        self.view.addSubview(profilePage)
        profilePage.emailTextField.isEnabled = true
        profilePage.emailTextField.delegate = self
        profilePage.passwordTextField.delegate = self
        usersession = (UIApplication.shared.delegate as! AppDelegate).usersession
        usersession.userSessionAccountDelegate = self
        usersession.userSessionSignInDelegate = self
        profilePage.delegate = self
         view.setGradientBackground(colorOne: UIColor.red.withAlphaComponent(0.7), colorTwo: UIColor.blue.withAlphaComponent(0.7), colorThree: UIColor.white.withAlphaComponent(0.7), colorFour: UIColor.brown.withAlphaComponent(0.7))
    }
   private func presentInitialTabBarController() {
        let signedInAdmin = TabBarViewController(accountType: AccountType.admin)
        present(signedInAdmin, animated: true)
}

    private func segue(){
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let destination = storyboard.instantiateViewController(withIdentifier: "ProfileTableViewController")
        let nav = UINavigationController(rootViewController: destination)
        navigationController?.present(nav, animated: true, completion: nil)
    }
}
extension AdminLoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}
extension AdminLoginViewController: LoginViewDelegate {
    func loginButtonPressed(_loginView: LoginView, accountState: AccountloginState) {
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
        case .existingAccount:
            usersession.signInExistingUser(email: userEmail, password: userPassword)
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
                let okAction = UIAlertAction(title: "Ok", style: .default) { [unowned self] _ in
                    self.segue()
                }
                alertController.addAction(okAction)
                self.present(alertController, animated: true)
            }
        }
    }
}

extension AdminLoginViewController: UserSessionSignedDelegate {
    func didSignInExistingUser(_ usersession: UserSession, user: User) {
        presentInitialTabBarController()
    }
    
    func didRecieveSignInError(_ usersession: UserSession, error: Error) {
        showAlert(title: "Login Error", message: "Check email or password")
    }
}




