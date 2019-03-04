//
//  SignInViewController.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 2/9/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit
class signedInViewController: UIViewController {
    let signInPage = SignInView()
    private var usersession: UserSession!
    private var barbuttonItem:UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(signInPage)
        navigationItem.title = "PROFILE"
        settingButton()
        usersession = (UIApplication.shared.delegate as! AppDelegate).usersession
        usersession.userSessionSignOutDelegate = self
         logOut()
         view.setGradientBackground(colorOne: UIColor.red.withAlphaComponent(0.7), colorTwo: UIColor.blue.withAlphaComponent(0.7), colorThree: UIColor.white.withAlphaComponent(0.7), colorFour: UIColor.brown.withAlphaComponent(0.7))
        
    }
    
    private func settingButton(){
    
        barbuttonItem = UIBarButtonItem.init(image: UIImage.init(named: "icons8-settings"), style: .plain, target: self, action: #selector(setProfile))
        navigationItem.leftBarButtonItem = barbuttonItem
    }
    
    private func logOut(){
        barbuttonItem = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(logOutButtonPressed))
        navigationItem.rightBarButtonItem = barbuttonItem
    }
    
    @objc private func logOutButtonPressed(){
        usersession.logOut()
    }
    
    @objc private func setProfile(){
        let storybooard = UIStoryboard(name: "Main", bundle: nil)
        let profileTVC = storybooard.instantiateViewController(withIdentifier: "ProfileTableViewController")
        navigationController?.pushViewController(profileTVC, animated: true)
    }
}

extension signedInViewController: UserSessionSignOutDelegate {
    func didRecieveSignOutError(_ usersession: UserSession, error: Error) {
        print("Logout error: \(error)")
    }
    
    func didSignOutUser(_ usersession: UserSession) {
        let window = (UIApplication.shared.delegate as! AppDelegate).window
        let launchScreen = LaunchViewController()
        window?.rootViewController = launchScreen
    }
    
    
}

