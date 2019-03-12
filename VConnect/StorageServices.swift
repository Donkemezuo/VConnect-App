//
//  StorageServices.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 3/11/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import Foundation
import FirebaseStorage

struct StorageKeys {
    static let imagesKey = "images"
}

final class StorageService {
    static var storageRef: StorageReference = {
        let ref = Storage.storage().reference()
        return ref
    }()
    
    static public func postImage(imageData: Data,imageName: String, completionHandler: @escaping(Error?, URL?) -> Void){
        let metaData = StorageMetadata()
        let imageRef = storageRef.child(StorageKeys.imagesKey + "/\(imageName)")
        metaData.contentType = "image/jpg"
        let uploadTask = imageRef.putData(imageData, metadata: metaData) { (metadata, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let _ = metadata{
                
            }
        }
        uploadTask.observe(.failure) { (snapshot) in
            //
        }
        uploadTask.observe(.pause) { (snapshot) in
            //
        }
        uploadTask.observe(.progress) { (snapshot) in
            //
        }
        uploadTask.observe(.resume) { (snapshot) in
            //
        }
        uploadTask.observe(.success) { (snapshot) in
            imageRef.downloadURL(completion: { (url, error) in
                if let error = error {
                    completionHandler(error, nil)
                } else {
                    if let url = url {
                        completionHandler(nil, url)
                    }
                }
            })
        }
        
    }
}



