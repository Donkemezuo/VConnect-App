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
    
    
}
