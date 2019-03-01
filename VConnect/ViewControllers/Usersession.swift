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

protocol UserSessionSignedDelegate: AnyObject{
     func didSignInExistingUser(_ usersession: UserSession, user: User)
    func didRecieveSignInError(_ usersession: UserSession, error: Error)
}

protocol UserSessionSignOutDelegate: AnyObject {
    func didRecieveSignOutError(_ usersession: UserSession, error: Error)
    func didSignOutUser(_ usersession: UserSession)
}

final class UserSession {
    
    weak var userSessionAccountDelegate: UserSessionAccountCreationDelegate?
    weak var userSessionSignInDelegate: UserSessionSignedDelegate?
    weak var userSessionSignOutDelegate: UserSessionSignOutDelegate?
    
    
    public func createOrganization(email: String, password: String){
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                self.userSessionAccountDelegate?.didRecieveErrorCreatingAccount(self, error: error)
            } else if let authResult = authResult {
                self.userSessionAccountDelegate?.didCreateAccount(self, user: authResult.user)
            }
        }
    }
    
    public func signInExistingUser(email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { (authDataResult, error) in
            if let error = error {
               self.userSessionSignInDelegate?.didRecieveSignInError(self, error: error)
            } else if let authDataResult = authDataResult {
                self.userSessionSignInDelegate?.didSignInExistingUser(self, user: authDataResult.user)
            }
        }
    }
    
    public func getCurrentUser() -> User? {
        return Auth.auth().currentUser
    }
    
    
    
    public func logOut(){
        guard let _ = getCurrentUser() else {
            print("no current user logged in")
            return
        }
        do {
        try Auth.auth().signOut()
            userSessionSignOutDelegate?.didSignOutUser(self)
        } catch {
           userSessionSignOutDelegate?.didRecieveSignOutError(self, error: error)
        }
    }
    
}
