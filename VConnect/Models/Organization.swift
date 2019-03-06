//
//  OrganizationModel.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 2/28/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import Foundation
struct Organization {
    let adminFirstName: String
    let adminLastame: String
    let whoAreYou: String
    let organizationName: String  
    let organizationPhoneNumber: String
    let organizationSecondaryPhoneNumber: String
    let organizationEmail: String
    let organizationStreetAddress: String
    let organizationCity: String
    let organizationZipCode: String
    let organizationState: String
    let organizationGeoPoliticalZone: String
    let organizationWebsite: String
    let organizationServices: String
    let organizationCategory: String
    let organizationImage: Data?
    let contactPersonFirstName: String
    let contactPersonLastName: String
    let contactPersonPhoneNumber: String
    let contactPersonEmail: String
    var formattedAddress:String {
        let address = """
        
        \(organizationStreetAddress)
        \(organizationCity)
        \(organizationZipCode)
        \(organizationState)
        
        """
        return address
    }
    init(adminFirstName: String, adminLastame: String, whoAreYou: String,organizationName: String,organizationPhoneNumber: String,organizationSecondaryPhoneNumber: String, organizationEmail: String, organizationStreetAddress: String, organizationCity: String,organizationZipCode: String, organizationState: String, organizationGeoPoliticalZone: String, organizationWebsite: String, organizationServices: String,organizationCategory: String, organizationImage: Data?,contactPersonFirstName: String,contactPersonLastName: String, contactPersonPhoneNumber: String, contactPersonEmail: String) {
        self.adminFirstName = adminFirstName
        self.adminLastame = adminLastame
        self.whoAreYou = whoAreYou
        self.organizationName = organizationName
        self.organizationPhoneNumber = organizationPhoneNumber
        self.organizationSecondaryPhoneNumber = organizationSecondaryPhoneNumber
        self.organizationEmail = organizationEmail
        self.organizationStreetAddress = organizationStreetAddress
        self.organizationCity = organizationCity
        self.organizationZipCode = organizationZipCode
        self.organizationState = organizationState
        self.organizationGeoPoliticalZone = organizationGeoPoliticalZone
        self.organizationWebsite = organizationWebsite
        self.organizationServices = organizationServices
        self.organizationCategory = organizationCategory
        self.organizationImage = organizationImage
        self.contactPersonFirstName = contactPersonFirstName
        self.contactPersonLastName = contactPersonLastName
        self.contactPersonPhoneNumber = contactPersonPhoneNumber
        self.contactPersonEmail = contactPersonEmail
    }
    
    init(dict: [String: Any]) {
        self.adminFirstName =  dict["adminFirstName"] as? String ?? "no admin first name"
        self.adminLastame = dict["adminLastame"] as? String ?? "no admin last name"
        self.whoAreYou = dict["whoAreYou"] as? String ?? "no admin job name"
        self.organizationName = dict["organizationName"] as? String ?? "no organization name"
        self.organizationPhoneNumber = dict["organizationPhoneNumber"] as? String ?? "no organization phone number"
        self.organizationSecondaryPhoneNumber =  dict["organizationSecondaryPhoneNumber"] as? String ?? "no organization secondary phone number"
        self.organizationEmail = dict["organizationEmail"] as? String ?? "no organization email"
        self.organizationStreetAddress = dict["organizationStreetAddress"] as? String ?? "no organization address"
        self.organizationCity =  dict["organizationCity"] as? String ?? "no organization city"
        self.organizationZipCode = dict["organizationZipCode"] as? String ?? "no organization zipcode"
        self.organizationState = dict["organizationState"] as? String ?? "no organization state"
        self.organizationGeoPoliticalZone = dict["organizationGeoPoliticalZone"] as? String ?? "no organization geopolitical zone"
        self.organizationWebsite =  dict["organizationWebsite"] as? String ?? "no organization website"
        self.organizationServices =  dict["organizationServices"] as? String ?? "no organization services"
        self.organizationCategory =  dict["organizationCategory"] as? String ?? "no organization category"
        self.organizationImage =  (dict["organizationImage"] as? Data)
        self.contactPersonEmail = dict["contactPersonEmail"] as? String ?? "no contact person email"
        self.contactPersonFirstName = dict["contactPersonFirstName"] as? String ?? "no contact person's first name"
        self.contactPersonLastName = dict["contactPersonLastName"] as? String ?? "no contact person's last name"
        self.contactPersonPhoneNumber = dict["contactPersonPhoneNumber"] as? String ?? "no contact person's phone number"
        
    }
    
}


