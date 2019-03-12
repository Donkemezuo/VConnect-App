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
        ref?.setData([OrganizationCollectionKeys.organizationName: organization.organizationName,OrganizationCollectionKeys.organizationPhoneNumber: organization.organizationPhoneNumber, OrganizationCollectionKeys.organizationSecondaryPhoneNumber: organization.organizationSecondaryPhoneNumber, OrganizationCollectionKeys.organizationEmail: organization.organizationEmail, OrganizationCollectionKeys.organizationStreetAddress: organization.organizationStreetAddress, OrganizationCollectionKeys.organizationCity: organization.organizationCity, OrganizationCollectionKeys.organizationZipCode: organization.organizationZipCode, OrganizationCollectionKeys.organizationState: organization.organizationState, OrganizationCollectionKeys.organizationGeoPoliticalZone: organization.organizationGeoPoliticalZone, OrganizationCollectionKeys.organizationWebsite: organization.organizationWebsite, OrganizationCollectionKeys.organizationServices: organization.organizationServices, OrganizationCollectionKeys.organizationCategory: organization.organizationCategory, OrganizationCollectionKeys.organizationImage:organization.organizationImage, OrganizationCollectionKeys.contactPersonFirstName:organization.contactPersonFirstName, OrganizationCollectionKeys.contactPersonLastName:organization.contactPersonLastName,OrganizationCollectionKeys.contactPersonPhoneNumber:organization.contactPersonPhoneNumber,OrganizationCollectionKeys.contactPersonEmail:organization.contactPersonEmail, OrganizationCollectionKeys.adminFirstName:organization.adminFirstName, OrganizationCollectionKeys.adminLastame:organization.adminLastame, OrganizationCollectionKeys.whoAreYou:organization.whoAreYou, OrganizationCollectionKeys.lat: organization.lat, OrganizationCollectionKeys.long:organization.long], completion: { (error) in
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
        ref?.setData([PostCollects.postedBy: Post.postedBy, PostCollects.storyTitle: Post.storyTitle, PostCollects.storyDetails:Post.storyDetails, PostCollects.postedDate:Post.postedDate, PostCollects.imageURL: Post.imageURL, PostCollects.documentID: Post.documentID], completion: { (error) in
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
    

