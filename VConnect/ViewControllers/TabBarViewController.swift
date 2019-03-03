//
//  TabBarViewController.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 2/25/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit
import CoreLocation

enum AccountType {
    case admin
    case user
}

class TabBarViewController: UITabBarController {
    
    private var accountType = AccountType.admin
    let timeLineVC = UINavigationController.init(rootViewController: TimeLineViewController())
    let resourcesVC = UINavigationController.init(rootViewController: ResourcesViewController())
    let signedInVC = UINavigationController.init(rootViewController: signedInViewController())
    
    let locationManager = CLLocationManager()
    
    convenience init(accountType: AccountType){
        self.init(nibName: nil, bundle: nil)
        self.accountType = accountType
        
        switch accountType {
        case .admin:
            viewControllers = [signedInVC, timeLineVC,resourcesVC]
             timeLineVC.tabBarItem = UITabBarItem.init(title: "TimeLine", image: UIImage.init(named: "icons8-google_sites"), selectedImage: UIImage.init(named: "icons8-google_sites"))
           
            resourcesVC.tabBarItem = UITabBarItem.init(title: "Resources", image: UIImage.init(named: "icons8-home_filled"), selectedImage:  UIImage.init(named: "icons8-home_filled"))
            
            signedInVC.tabBarItem = UITabBarItem.init(title: "Profile", image: UIImage.init(named: "icons8-gender_neutral_user_filled"), selectedImage: UIImage.init(named: "icons8-gender_neutral_user_filled"))
            
        case .user:
            viewControllers = [timeLineVC, resourcesVC,]
            timeLineVC.tabBarItem = UITabBarItem.init(title: "TimeLine", image: UIImage.init(named: "icons8-google_sites"), selectedImage: UIImage.init(named: "icons8-google_sites"))
            
            resourcesVC.tabBarItem = UITabBarItem.init(title: "Resources", image: UIImage.init(named: "icons8-home_filled"), selectedImage:  UIImage.init(named: "icons8-home_filled"))
            locationAuthorization()
    }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationServices()
        locationManager.delegate = self
    }
    
    
    private func locationAuthorization(){
        switch CLLocationManager.authorizationStatus() {
        
        case .authorizedWhenInUse:
            break
        case .authorizedAlways:
            break
        case .denied:
            break
        case .restricted:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
        }
    }
    
    private func checkLocationServices(){
        if CLLocationManager.locationServicesEnabled() {
            locationAuthorization()
        } else {
            showAlert(title: "Error", message: "Please enable your location services")
        }
    }
    }

extension TabBarViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        locationAuthorization()
    }
}
    

  


