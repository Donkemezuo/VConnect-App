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
    private var organization: Organization!
    private var barbuttonItem: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(detailVC)
        donateButton()
        setupDetailVC()
        
        var gradient: CAGradientLayer!
        
        let firstColor = UIColor.init(red: 0/255, green: 34/255, blue: 62/255, alpha: 1.0)
        let secondColor = UIColor.init(red: 255/255, green: 161/255, blue: 127/255, alpha: 1.0)
        gradient = CAGradientLayer()
        gradient.colors = [firstColor.cgColor, secondColor.cgColor]
        gradient.frame = view.bounds
        view.layer.insertSublayer(gradient, at: 0)
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
    
    
    init(organizationDetails: Organization){
        super.init(nibName: nil, bundle: nil)
        self.organization = organizationDetails
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
   private func setupDetailVC(){
  
    detailVC.contactEmail.text = organization.contactPersonEmail
    detailVC.contactPhoneNumber.text = organization.contactPersonPhoneNumber
    if let imageData = organization.organizationImage {
        
        detailVC.imageView.image = UIImage.init(data: imageData)

    }
    detailVC.organizationAddress.text = organization.formattedAddress
    detailVC.organizationDescription.text = organization.organizationServices
    detailVC.organizationWebsite.text = organization.organizationWebsite
    }
    
    
    }
    


