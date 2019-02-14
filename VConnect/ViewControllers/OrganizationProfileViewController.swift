//
//  OrganizationProfileViewController.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 2/8/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class OrganizationProfileViewController: UIViewController, signInButtonDelegate {
    func signInButtonClicked() {
        let signInPage = SignInViewController()
            signInPage.modalPresentationStyle = .overFullScreen
            signInPage.modalTransitionStyle = .crossDissolve
        present(signInPage, animated: true, completion: nil)
    }
    
    let signupVC = SignUpViewController()
    
    let profilePage = ProfileView()
    private var tapGesture: UITapGestureRecognizer!

    override func viewDidLoad() {
        super.viewDidLoad()
         view.backgroundColor =  UIColor.green.withAlphaComponent(0.5)
        self.view.addSubview(profilePage)
        self.profilePage.delegate = self
        createAccountClicked()

    }
    
    func createAccountClicked(){
        profilePage.label.isUserInteractionEnabled = true
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(gesture:)))
        profilePage.label.addGestureRecognizer(tapGesture)
        
    }
    
    @objc func handleTap(gesture: UITapGestureRecognizer){
        navigationController?.pushViewController(signupVC, animated: true)
    }
    
    



}
