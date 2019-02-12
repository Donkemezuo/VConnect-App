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
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        self.view.addSubview(detailVC)

      
    }
    
    init(name: String){
        super.init(nibName: nil, bundle: nil)
        self.detailVC.label.text = name
          setupDetailVC()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupDetailVC(){
        detailVC.imageView.image = UIImage.init(named: "HoldHands")
        
    }
    

}
