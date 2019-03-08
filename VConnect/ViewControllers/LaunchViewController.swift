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
        //view.backgroundColor = UIColor.init(displayP3Red: #0f0c29, green: <#T##CGFloat#>, blue: <#T##CGFloat#>, alpha: <#T##CGFloat#>)
        setUpTabView()
    }
    
   // func getColorFromHex(rgbValue: UInt32) -> UIColor {
     //   let color1 = CGFloat((rgbValue & #0f0c29)>> 16)/255.0
    //}
    
    func setUpTabView() {
        lauchView.addminButton.isUserInteractionEnabled = true
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(addminButtonPressed(gesture:)))
        lauchView.addminButton.addGestureRecognizer(tapGesture)
        
        lauchView.exploreButton.isUserInteractionEnabled = true
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(exploreButtonPressed(gesture:)))
        lauchView.exploreButton.addGestureRecognizer(tapGesture)
        
    }
    
    
    
    @objc private func addminButtonPressed(gesture: UITapGestureRecognizer){
        let destinationVC = UINavigationController.init(rootViewController: AdminLoginViewController())
        present(destinationVC, animated: true, completion: nil)
    }
    
    @objc private func exploreButtonPressed(gesture: UITapGestureRecognizer){
        
     let exploreTab = TabBarViewController(accountType: AccountType.user)
      present(exploreTab, animated: true)

    }

}
