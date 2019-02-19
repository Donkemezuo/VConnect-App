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
    
    let timeLineVC = UINavigationController.init(rootViewController: TimeLineViewController())
    let resourcesVC = UINavigationController.init(rootViewController: ResourcesViewController())
    let profilepage = UINavigationController.init(rootViewController: AdminLoginViewController())
    let postVC = UINavigationController.init(rootViewController: PostViewController())
    let tabBar = UITabBarController()
    
    
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
        tabBar.viewControllers = [profilepage,timeLineVC,resourcesVC]
        tabBar.modalPresentationStyle = .overFullScreen
       present(tabBar, animated: true)
        
        timeLineVC.tabBarItem = UITabBarItem.init(title: "", image:UIImage.init(named:"icons8-home_filled" ) , selectedImage: UIImage.init(named:"icons8-home_filled" ))
        
        resourcesVC.tabBarItem = UITabBarItem.init(title: "", image: UIImage.init(named:"icons8-google_sites" ), selectedImage: UIImage.init(named: "icons8-google_sites"))
        
        profilepage.tabBarItem = UITabBarItem.init(title: "", image: UIImage.init(named: "icons8-gender_neutral_user_filled"), selectedImage:UIImage.init(named: "icons8-gender_neutral_user_filled"))
    }
    
    @objc private func exploreButtonPressed(gesture: UITapGestureRecognizer){
        tabBar.viewControllers = [timeLineVC,resourcesVC]
        tabBar.modalPresentationStyle = .overFullScreen
        
       present(tabBar, animated: true)
        timeLineVC.tabBarItem = UITabBarItem.init(title: "", image:UIImage.init(named:"icons8-home_filled" ) , selectedImage: UIImage.init(named:"icons8-home_filled" ))
        resourcesVC.tabBarItem = UITabBarItem.init(title: "", image: UIImage.init(named:"icons8-google_sites" ), selectedImage: UIImage.init(named: "icons8-google_sites"))
    }

}
