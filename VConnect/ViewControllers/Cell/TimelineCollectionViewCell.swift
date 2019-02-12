//
//  TimelineCollectionViewCell.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 2/11/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class TimelineCollectionViewCell: UICollectionViewCell {
    
    let textView:UITextView = {
        let textView = UITextView()
        textView.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        return textView
    }()
    
    let label:UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.red.withAlphaComponent(0.6)
        label.text = "Number of likes"
        label.sizeToFit()
        return label
    }()
    
    let button: UIButton = {
        let likeButton = UIButton()
            likeButton.setImage(UIImage.init(named: "icons8-like_it"), for: .normal)
        likeButton.backgroundColor = .white
        return likeButton
        
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
        addSubview(textView)
        addSubview(label)
        addSubview(button)
        textView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        textView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        textView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        textView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        textView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -80).isActive = true
        label.topAnchor.constraint(equalTo: textView.bottomAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        
        button.topAnchor.constraint(equalTo: label.bottomAnchor,constant: 30).isActive = true
        button.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -350).isActive = true
        button.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
    
    
    
    
}
