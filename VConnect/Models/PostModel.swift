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
    
    init(postedBy: String, storyTitle: String, storyDetails: String,postedDate: String) {
        self.postedDate = postedDate
        self.postedBy = postedBy
        self.storyDetails = storyDetails
        self.storyTitle =  storyTitle
    }
    
    init(dict: [String:Any]){
        self.postedBy = dict["postedBy"] as? String ?? "no poster name"
        self.storyDetails = dict["storyDetails"] as? String ?? "No story details"
        self.storyTitle = dict["storyTitle"] as? String ?? "No story title"
        self.postedDate = dict["postedDate"] as? String
      
        
    }
}


