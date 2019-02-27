//
//  ProfileTableViewController.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 2/25/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class ProfileTableViewController: UITableViewController {
    
    // Admin info
    @IBOutlet weak var adminFirstName: UITextView!
    @IBOutlet weak var adminLastName: UITextView!
    @IBOutlet weak var adminJobTitle: UIView!
    
    // Organization Info
    @IBOutlet weak var organizationName: UITextView!
    @IBOutlet weak var organizationPhoneNumber: UITextView!
    @IBOutlet weak var organizationSecondaryPhoneNumber: UITextView!
    @IBOutlet weak var organizationEmailAddress: UITextView!
    @IBOutlet weak var organizationStress: UITextView!
    @IBOutlet weak var organizationCity: UITextView!
    @IBOutlet weak var organizationZipcode: UITextView!
    @IBOutlet weak var organizationState: UITextView!
    @IBOutlet weak var organizationGeoPoliticalZone: UITextView!
    @IBOutlet weak var organizationWebsite: UITextView!
    @IBOutlet weak var servicesOffered: UITextView!
    
    
    // Organization Contact Person Info
    
    @IBOutlet weak var organizationContactPersonFirstName: UITextView!
    @IBOutlet weak var organizationContactPersonLastName: UITextView!
    @IBOutlet weak var organizationContactPersonPhoneNumber: UITextView!
    @IBOutlet weak var organizationContactPersonEmail: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }

}
