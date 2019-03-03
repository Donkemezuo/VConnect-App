//
//  DatabaseManager.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 2/28/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


final class DatabaseManager {
    private init(){}
    
    static let firebaseDataBase: Firestore = {
        let dataBase = Firestore.firestore()
        let settings = dataBase.settings
    settings.areTimestampsInSnapshotsEnabled = true
        dataBase.settings = settings
        return dataBase
    }()
    
    static func createOrganizationToDatabase(organization: Organization) {
        var ref: DocumentReference? = nil
        ref = firebaseDataBase.collection("Organization").addDocument(data: ["organizationName": organization.organizationName,"organizationPhoneNumber": organization.organizationPhoneNumber, "organizationSecondaryPhoneNumber": organization.organizationSecondaryPhoneNumber, "organizationEmail": organization.organizationEmail, "organizationStreetAddress": organization.organizationStreetAddress, "organizationCity": organization.organizationCity, "organizationZipCode": organization.organizationZipCode, "organizationState": organization.organizationState, "organizationGeoPoliticalZone": organization.organizationGeoPoliticalZone, "organizationWebsite": organization.organizationWebsite, "organizationServices": organization.organizationServices, "organizationCategory": organization.organizationCategory, "organizationImage":organization.organizationImage, "contactPersonFirstName":organization.contactPersonFirstName, "contactPersonLastName":organization.contactPersonLastName,"contactPersonPhoneNumber":organization.contactPersonPhoneNumber,"contactPersonEmail":organization.contactPersonEmail, "adminFirstName":organization.adminFirstName, "adminLastame":organization.adminLastame, "whoAreYou":organization.whoAreYou], completion: { (error) in
            if let error = error {
                print("Error: \(error) encountered while creating organization. Please try again")
            } else {
                print("Created organization using ref: \(ref?.documentID ?? "no organization id")")
                
                DatabaseManager.firebaseDataBase.collection(DataBaseKeys.organizationCollectionKey).document(ref!.documentID)
                    .updateData(["dbReference":ref!.documentID], completion: { (error) in
                        if let error = error {
                            print("Error updating fields: \(error)")
                        } else {
                            print("fields updated")
                        }
                    })
            }
        })
    }
    
}
