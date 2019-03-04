//
//  UIView+Extension.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 3/4/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

extension UIView {

    func setGradientBackground(colorOne: UIColor, colorTwo: UIColor, colorThree: UIColor, colorFour: UIColor){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor, colorThree.cgColor, colorFour.cgColor]
        gradientLayer.locations = [0.2,0.2,0.2,0.2]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
}
