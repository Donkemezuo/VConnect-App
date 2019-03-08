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
    let usersession = UserSession()
    private init(){}
    
    static let firebaseDataBase: Firestore = {
        let dataBase = Firestore.firestore()
        let settings = dataBase.settings
        dataBase.settings = settings
        return dataBase
    }()
    
    static func createOrganizationToDatabase(organization: Organization) {
        var ref: DocumentReference? = nil
        
        ref = firebaseDataBase.collection("Organization").document((UserSession.init().getCurrentUser()?.uid)!)
        ref?.setData(["organizationName": organization.organizationName,"organizationPhoneNumber": organization.organizationPhoneNumber, "organizationSecondaryPhoneNumber": organization.organizationSecondaryPhoneNumber, "organizationEmail": organization.organizationEmail, "organizationStreetAddress": organization.organizationStreetAddress, "organizationCity": organization.organizationCity, "organizationZipCode": organization.organizationZipCode, "organizationState": organization.organizationState, "organizationGeoPoliticalZone": organization.organizationGeoPoliticalZone, "organizationWebsite": organization.organizationWebsite, "organizationServices": organization.organizationServices, "organizationCategory": organization.organizationCategory, "organizationImage":organization.organizationImage, "contactPersonFirstName":organization.contactPersonFirstName, "contactPersonLastName":organization.contactPersonLastName,"contactPersonPhoneNumber":organization.contactPersonPhoneNumber,"contactPersonEmail":organization.contactPersonEmail, "adminFirstName":organization.adminFirstName, "adminLastame":organization.adminLastame, "whoAreYou":organization.whoAreYou, "lat": organization.lat, "long":organization.long], completion: { (error) in
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
    
    static func createApostToDatabase(Post: Post) {
        var ref: DocumentReference? = nil
        ref = firebaseDataBase.collection("Post").document((UserSession.init().getCurrentUser()?.uid)!)
        ref?.setData(["poster": Post.postedBy, "storyTitle": Post.storyTitle, "storyDetails":Post.storyDetails, "postedDate":Post.postedDate], completion: { (error) in
            if let error = error {
                print("Error: \(error) encountered while trying to post story. Please try again")
            
            } else {
                print("Story posted using ref: \(ref?.documentID ?? "no user id")")
                DatabaseManager.firebaseDataBase.collection(DataBaseKeys.postCollectionKey).document((ref?.documentID)!).updateData(["dbReference": ref?.documentID], completion: { (error) in
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
    

