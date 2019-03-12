//
//  LongAndLatDataManager.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 3/7/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import Foundation

final class LatAndLongDataManager{
    static func getLatAndLong(lat: Double, Long: Double){
    }
    
     var lat:Double = {
        return Double()
    }()
    
    var long:Double = {
        return Double()
    }()
    
    static var coordinate: LatAndLongDataManager = {
       return LatAndLongDataManager()
    }()
    

}
