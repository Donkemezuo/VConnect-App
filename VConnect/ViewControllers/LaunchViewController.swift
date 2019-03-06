//
//  LaunchViewController.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 2/15/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {
    
    let lauchView = LauchView()
    
    private var tapGesture: UITapGestureRecognizer!


    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(lauchView)
        view.backgroundColor = .green
        setUpTabView()
    }
    func setUpTabView() {
        lauchView.addminButton.isUserInteractionEnabled = true
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(addminButtonPressed(gesture:)))
        lauchView.addminButton.addGestureRecognizer(tapGesture)
        
        lauchView.exploreButton.isUserInteractionEnabled = true
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(exploreButtonPressed(gesture:)))
        lauchView.exploreButton.addGestureRecognizer(tapGesture)
        
    }
    
    @objc private func addminButtonPressed(gesture: UITapGestureRecognizer){
       //present(AdminLoginViewController(), animated: true, completion: nil)
        let destinationVC = UINavigationController.init(rootViewController: AdminLoginViewController())
       // navigationController?.pushViewController(destinationVC, animated: true)
        present(destinationVC, animated: true, completion: nil)
    }
    
    @objc private func exploreButtonPressed(gesture: UITapGestureRecognizer){
        
     let exploreTab = TabBarViewController(accountType: AccountType.user)
      present(exploreTab, animated: true)

    }

}
