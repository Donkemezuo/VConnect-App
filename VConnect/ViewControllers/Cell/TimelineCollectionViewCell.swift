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
        textView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        textView.font =  UIFont.boldSystemFont(ofSize: 20)
        textView.numberOfLines = 0
        textView.layer.borderWidth = 0.5
        return textView
    }()
    
    public lazy var imageView: UIImageView = {
        let imageView = UIImageView()
            imageView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            imageView.image = UIImage.init(named: "newsLogo")
            imageView.layer.borderWidth = 0.5
        return imageView
        
    }()
    
      public lazy var poster:UILabel = {
        let label = UILabel()
        label.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.text = "Source"
        label.sizeToFit()
        label.layer.borderWidth = 0.5
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
        textView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        textView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        textView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.20).isActive = true
        
        poster.topAnchor.constraint(equalTo: textView.bottomAnchor).isActive = true
        poster.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        poster.trailingAnchor.constraint(equalTo: trailingAnchor,constant: 0).isActive = true
        poster.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
 
    }
    
    
    
    
}
