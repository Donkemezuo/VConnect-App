//
//  DetailViewController.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 2/11/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    let detailVC = DetailView()
    private var organizationName: String!
    private var barbuttonItem: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        self.view.addSubview(detailVC)
        donateButton()
      
    }
    private func donateButton(){
        barbuttonItem = UIBarButtonItem.init(title: "Donate", style: .plain, target: self, action: #selector(donateButtonClicked))
        navigationItem.rightBarButtonItem =  barbuttonItem
    }
    
    @objc private func donateButtonClicked(){
        
    let alertController = UIAlertController.init(title: "Options", message: "Please choose how to donate to this organization", preferredStyle: .actionSheet)
        
        let cloth = UIAlertAction.init(title: "Cloth", style: .default) { (alert) in
            
        }
        
        let cash =  UIAlertAction.init(title: "Cash", style: .default) { (alert) in
            
        }
        
        let volunteer = UIAlertAction.init(title: "Volunteer", style: .default) { (alert) in
            
        }
        
        let cancel = UIAlertAction.init(title: "Cancel", style: .cancel) { (alert) in
            
        }
        
    alertController.addAction(cash)
    alertController.addAction(cloth)
    alertController.addAction(volunteer)
    alertController.addAction(cancel)
        
    present(alertController, animated: true)
        
    }
    
    
    init(name: String){
        super.init(nibName: nil, bundle: nil)
          setupDetailVC()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupDetailVC(){
        detailVC.imageView.image = UIImage.init(named: "HoldHands")
        
    }
    

}
