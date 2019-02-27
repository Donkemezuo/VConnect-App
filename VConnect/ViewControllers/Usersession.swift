//
//  Usersession.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 2/27/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit
import FirebaseAuth
protocol UserSessionAccountCreationDelegate: AnyObject {
    func didCreateAccount(_ userSession: UserSession, user: User)
    func didRecieveErrorCreatingAccount(_ userSession: UserSession, error: Error)
}

final class UserSession {
    
    weak var userSessionAccountDelegate: UserSessionAccountCreationDelegate!
    
    
    public func createOrganization(email: String, password: String){
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
            self.userSessionAccountDelegate.didRecieveErrorCreatingAccount(self, error: error)
            } else if let authResult = authResult {
                self.userSessionAccountDelegate.didCreateAccount(self, user: authResult.user)
            }
        }
    }
    
    public func signInExistingUser(email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                //self.
            }
        }
    }
    
    
    
}
