//
//  SignUpViewController.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 2/9/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    let signupView = SignUpView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(signupView)
        view.backgroundColor = UIColor.blue
    }

}
