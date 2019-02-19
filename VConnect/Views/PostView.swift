//
//  PostView.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 2/16/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class PostView: UIView {

    public lazy var postView: UITextView = {
        let postView = UITextView()
        postView.text = "Write a post"
        postView.textColor = .black
        postView.backgroundColor = UIColor.red.withAlphaComponent(0.7)
        postView.font = UIFont.boldSystemFont(ofSize: 20)
        return postView
        
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
        addSubview(postView)
        
        postView.translatesAutoresizingMaskIntoConstraints = false
        postView.topAnchor.constraint(lessThanOrEqualTo: topAnchor).isActive = true
        postView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        postView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        postView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        
    }
    

    

}
