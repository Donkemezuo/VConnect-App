//
//  BackgroundColorClass.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 3/8/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import Foundation
import UIKit

final class BackgroundColorManager {
    
    static func setColorGradients(view: UIView){
    var gradient: CAGradientLayer!
        
        let firstColor = UIColor.init(red: 15/255, green: 12/255, blue: 41/255, alpha: 1.0)
        let secondColor = UIColor.init(red: 48/255, green: 43/255, blue: 99/255, alpha: 1.0)
        let thirdColor = UIColor.init(red: 36/255, green: 36/255, blue: 62/255, alpha: 1.0)
        gradient = CAGradientLayer()
        gradient.colors = [firstColor.cgColor, secondColor.cgColor,thirdColor.cgColor]
        let view = UIView(frame: view.bounds)
        view.layer.addSublayer(gradient)
        
        
    }
    
    
}
