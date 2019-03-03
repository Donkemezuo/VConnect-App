//
//  ProfileTableViewController.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 2/25/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class ProfileTableViewController: UITableViewController {
    
    private var imageData:Data?
    
    private var barButton:UIBarButtonItem!
    private var jobs = ["Administrator","Volunteer"]
    private var tap: UITapGestureRecognizer!
    private var pickerView: UIPickerView!
    // Admin info
    @IBOutlet weak var adminFirstName: UITextView!
    @IBOutlet weak var adminLastName: UITextView!
    @IBOutlet weak var adminJobTitle: UILabel!
    
    
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
    @IBOutlet weak var category: UITextView!
    
    // Organization Contact Person Info
    
    @IBOutlet weak var organizationContactPersonFirstName: UITextView!
    @IBOutlet weak var organizationContactPersonLastName: UITextView!
    @IBOutlet weak var organizationContactPersonPhoneNumber: UITextView!
    @IBOutlet weak var organizationContactPersonEmail: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1).withAlphaComponent(0.5)
        saveButtonSetup()
    }
    
    init(imageData: Data, adminName: String){
        super.init(nibName: nil, bundle: nil)
        self.imageData = imageData
        self.adminFirstName.text = adminName
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func saveButtonSetup(){
        barButton =  UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonPressed))
        navigationItem.rightBarButtonItem = barButton
    }
    
    @objc private func saveButtonPressed(){
       guard let administratorsfirstName = adminFirstName.text,
        let administratorslastName = adminLastName.text,
        let organizationName = organizationName.text,
        let organizationPhoneNumber = organizationPhoneNumber.text,
        let organizationSecondaryPhoneNumber = organizationSecondaryPhoneNumber.text,
        let organizationEmailAddress = organizationEmailAddress.text,
        let organizationStress = organizationStress.text,
        let organizationCity = organizationCity.text,
        let organizationZipcode = organizationZipcode.text,
        let organizationState = organizationState.text,
        let organizationGeoPoliticalZone = organizationGeoPoliticalZone.text,
        let organizationWebsite = organizationWebsite.text,
        let servicesOffered = servicesOffered.text,
        let organizationContactPersonFirstName = organizationContactPersonFirstName.text,
        let organizationContactPersonLastName = organizationContactPersonLastName.text,
        let organizationContactPersonPhoneNumber = organizationContactPersonPhoneNumber.text,
        let organizationContactPersonEmail = organizationContactPersonEmail.text,
        let job = adminJobTitle.text,
        let category = category.text else {return}
        
        //var data: Data?
        let organization = Organization.init(adminFirstName: administratorsfirstName, adminLastame: administratorslastName, whoAreYou: job, organizationName: organizationName, organizationPhoneNumber: organizationPhoneNumber, organizationSecondaryPhoneNumber: organizationSecondaryPhoneNumber, organizationEmail: organizationEmailAddress, organizationStreetAddress: organizationStress, organizationCity: organizationCity, organizationZipCode: organizationZipcode, organizationState: organizationState, organizationGeoPoliticalZone: organizationGeoPoliticalZone, organizationWebsite: organizationWebsite, organizationServices: servicesOffered, organizationCategory: category, organizationImage: imageData, contactPersonFirstName: organizationContactPersonFirstName, contactPersonLastName: organizationContactPersonLastName, contactPersonPhoneNumber: organizationContactPersonPhoneNumber, contactPersonEmail: organizationContactPersonEmail)
        DatabaseManager.createOrganizationToDatabase(organization: organization)
        showAlert(title: "Successfully registered organization", message: "Successfully registered organization")
    }

    
}





