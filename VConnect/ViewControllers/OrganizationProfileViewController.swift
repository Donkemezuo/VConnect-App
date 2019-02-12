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
        navigationController?.pushViewController(signInPage, animated: true)
    }
    
    let profilePage = ProfileView()

    override func viewDidLoad() {
        super.viewDidLoad()
         view.backgroundColor =  UIColor.green.withAlphaComponent(0.5)
        self.view.addSubview(profilePage)
        self.profilePage.delegate = self 

    }
    



}
