//
//  SignInViewController.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 2/9/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    let signInPage = SignInView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(signInPage)
        self.view.backgroundColor = UIColor.red
        
    }
    


}
