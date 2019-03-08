//
//  TimelineCollectionViewCell.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 2/11/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class TimelineCollectionViewCell: UICollectionViewCell {
    
    public lazy var textView:UILabel = {
        let textView = UILabel()
        textView.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1).withAlphaComponent(0.5)
        textView.font =  UIFont.boldSystemFont(ofSize: 20)
        textView.numberOfLines = 0
        return textView
    }()
    
    public lazy var imageView: UIImageView = {
        let imageView = UIImageView()
            imageView.backgroundColor = #colorLiteral(red: 0.4397589564, green: 0, blue: 0.04436910897, alpha: 0.5391427654).withAlphaComponent(0.5)
            imageView.image = UIImage.init(named: "newsLogo")
        return imageView
        
    }()
    
      public lazy var poster:UILabel = {
        let label = UILabel()
        label.backgroundColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1).withAlphaComponent(0.5)
        label.text = "Source"
        label.sizeToFit()
        return label
    }()
    

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInt()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInt()
    }
    private func commonInt(){
        setConstrains()
    }
    private func setConstrains(){
        addSubview(imageView)
        addSubview(textView)
        addSubview(poster)
     
        imageView.translatesAutoresizingMaskIntoConstraints = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        poster.translatesAutoresizingMaskIntoConstraints = false
      
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.70).isActive = true
        
        textView.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        textView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        textView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        textView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.20).isActive = true
        
        poster.topAnchor.constraint(equalTo: textView.bottomAnchor).isActive = true
        poster.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        poster.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10).isActive = true
        poster.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
 
    }
    
    
    
    
}
