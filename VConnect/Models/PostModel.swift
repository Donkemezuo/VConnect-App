//
//  PostModel.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 3/8/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import Foundation

struct Post {
    let postedBy: String
    let storyTitle: String
    let storyDetails: String
    let postedDate: String?
    let imageURL: String
    let documentID: String
    init(postedBy: String, storyTitle: String, storyDetails: String,postedDate: String, imageURL: String,documentID: String ) {
        self.postedDate = postedDate
        self.postedBy = postedBy
        self.storyDetails = storyDetails
        self.storyTitle =  storyTitle
        self.imageURL = imageURL
        self.documentID = documentID
    }
    
    init(dict: [String:Any]){
        self.postedBy = dict[PostCollects.postedBy] as? String ?? "no poster name"
        self.storyDetails = dict[PostCollects.storyDetails] as? String ?? "No story details"
        self.storyTitle = dict[PostCollects.storyTitle] as? String ?? "No story title"
        self.postedDate = dict[PostCollects.postedDate] as? String
        self.imageURL =  dict[PostCollects.imageURL] as? String ?? "No image url"
        self.documentID = dict[PostCollects.documentID] as? String ?? "No document ID"
    }
}


