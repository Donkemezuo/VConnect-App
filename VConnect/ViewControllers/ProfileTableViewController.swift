//
//  ProfileTableViewController.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 2/25/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit
import FirebaseFirestore
import Firebase
@IBDesignable

class ProfileTableViewController: UITableViewController {
    
    private var imageData:Data?
    private var barButton:UIBarButtonItem!
    private var jobs = ["Administrator","Volunteer"]
     private var categories = ["Children and Women", "Youth Empowerment","Rape","Housing and Homelessness","Legal Aid", "Widow"]
    private var tap: UITapGestureRecognizer!
    private var pickerView: UIPickerView!
    private var imagePicker: UIImagePickerController!
    @IBOutlet weak var jobTitlePickerView: UIPickerView!
    @IBOutlet weak var organizationCategoryPickerView: UIPickerView!
    // Admin info
    @IBOutlet weak var adminFirstName: UITextView!
    @IBOutlet weak var adminLastName: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    private var adminJobTitle = ""
    private var organizationCategory = ""
    
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
        saveButtonSetup()
        setProfilePicture()
        //setImageViewLayOut()
        imageView.backgroundColor = #colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1).withAlphaComponent(0.5)
        jobTitlePickerView.delegate = self
        jobTitlePickerView.dataSource = self
        
        organizationCategoryPickerView.delegate = self
        organizationCategoryPickerView.dataSource = self
    }
    
    private func setImageViewLayOut(){
        imageView.layer.cornerRadius = imageView.bounds.width/2
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
    }
    private func setProfilePicture(){
        imageView.isUserInteractionEnabled = true
        tap = UITapGestureRecognizer(target: self, action: #selector(imageLibraryAccess))
         imageView.addGestureRecognizer(tap)
    }
    
    @objc private func imageLibraryAccess(){
       imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        if !UIImagePickerController.isSourceTypeAvailable(.camera) {
            UIImagePickerController.isSourceTypeAvailable(.photoLibrary)
        }
        present(imagePicker, animated: true, completion: nil)
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
        let organizationContactPersonEmail = organizationContactPersonEmail.text
        else {return}
        
        //var data: Data?
        let organization = Organization.init(adminFirstName: administratorsfirstName, adminLastame: administratorslastName, whoAreYou: adminJobTitle, organizationName: organizationName, organizationPhoneNumber: organizationPhoneNumber, organizationSecondaryPhoneNumber: organizationSecondaryPhoneNumber, organizationEmail: organizationEmailAddress, organizationStreetAddress: organizationStress, organizationCity: organizationCity, organizationZipCode: organizationZipcode, organizationState: organizationState, organizationGeoPoliticalZone: organizationGeoPoliticalZone, organizationWebsite: organizationWebsite, organizationServices: servicesOffered, organizationCategory: organizationCategory, organizationImage: imageData, contactPersonFirstName: organizationContactPersonFirstName, contactPersonLastName: organizationContactPersonLastName, contactPersonPhoneNumber: organizationContactPersonPhoneNumber, contactPersonEmail: organizationContactPersonEmail)
        DatabaseManager.createOrganizationToDatabase(organization: organization)
        showAlert(title: "Successfully registered organization", message: "Successfully registered organization")
    }

    
}

extension ProfileTableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = image
        } else {
            print("No image")
        }
        dismiss(animated: true, completion: nil)
        
    }
}

extension ProfileTableViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return jobs.count
        } else {
            if pickerView.tag == 2 {
                
            return categories.count
            }
        
        }
        
        return jobs.count
    
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 1 {
            return jobs[row]
        } else {
            if pickerView.tag == 2 {
                
                return categories[row]
            }
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView.tag == 1 {
            adminJobTitle = jobs[row]
        } else {
            if pickerView.tag == 2 {
                
                organizationCategory = categories[row]
            }
            
        }
    }
}

//extension ProfileTableViewController: UIPickerViewDataSource, UIPickerViewDelegate {
//
//}






