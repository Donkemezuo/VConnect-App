//
//  TabBarViewController.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 2/25/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

enum AccountType {
    case admin
    case user
}

class TabBarViewController: UITabBarController {
    
    private var accountType = AccountType.admin
    let timeLineVC = UINavigationController.init(rootViewController: TimeLineViewController())
    let resourcesVC = UINavigationController.init(rootViewController: ResourcesViewController())
    let signedInVC = UINavigationController.init(rootViewController: signedInViewController())
    
    convenience init(accountType: AccountType){
        self.init(nibName: nil, bundle: nil)
        self.accountType = accountType
        
        switch accountType {
        case .admin:
            viewControllers = [timeLineVC, resourcesVC,signedInVC]
             timeLineVC.tabBarItem = UITabBarItem.init(title: "TimeLine", image: UIImage.init(named: "icons8-google_sites"), selectedImage: UIImage.init(named: "icons8-google_sites"))
           
            resourcesVC.tabBarItem = UITabBarItem.init(title: "Resources", image: UIImage.init(named: "icons8-home_filled"), selectedImage:  UIImage.init(named: "icons8-home_filled"))
            
            signedInVC.tabBarItem = UITabBarItem.init(title: "Profile", image: UIImage.init(named: "icons8-gender_neutral_user_filled"), selectedImage: UIImage.init(named: "icons8-gender_neutral_user_filled"))
            
        case .user:
            viewControllers = [timeLineVC, resourcesVC,]
            timeLineVC.tabBarItem = UITabBarItem.init(title: "TimeLine", image: UIImage.init(named: "icons8-google_sites"), selectedImage: UIImage.init(named: "icons8-google_sites"))
            
            resourcesVC.tabBarItem = UITabBarItem.init(title: "Resources", image: UIImage.init(named: "icons8-home_filled"), selectedImage:  UIImage.init(named: "icons8-home_filled"))
    }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
   
    }
    

  


