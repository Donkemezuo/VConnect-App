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
    
     func setColorGradients(view: UIView){
        var gradient: CAGradientLayer!
        let firstColor = UIColor.init(red: 15/255, green: 12/255, blue: 41/255, alpha: 1.0)
        let secondColor = UIColor.init(red: 48/255, green: 43/255, blue: 99/255, alpha: 1.0)
        let thirdColor = UIColor.init(red: 36/255, green: 36/255, blue: 62/255, alpha: 1.0)
        gradient = CAGradientLayer()
        gradient.colors = [firstColor.cgColor, secondColor.cgColor,thirdColor.cgColor]
        let gradientView = UIView(frame: view.bounds)
        gradientView.layer.addSublayer(gradient)
        layer.insertSublayer(gradient, at: 0)

    
    
}
}
