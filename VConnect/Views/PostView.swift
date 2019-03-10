//
//  PostView.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 2/16/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class PostView: UIView {
    
    public lazy var postTitle:UITextField = {
        let postTitle = UITextField()
            postTitle.placeholder = "Please enter title"
            postTitle.font = UIFont.boldSystemFont(ofSize: 20)
            postTitle.textColor = .black
            postTitle.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        return postTitle
    }()
    public lazy var postView: UITextView = {
        let postView = UITextView()
        postView.text = "Write a post"
        postView.textColor = .black
        postView.font = UIFont.boldSystemFont(ofSize: 20)
        postView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
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
        setupTitleLabel()
        setupPostView()
    }
    
    private func setupTitleLabel(){
        addSubview(postTitle)
        postTitle.translatesAutoresizingMaskIntoConstraints = false
        postTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        postTitle.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        postTitle.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        postTitle.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.06).isActive = true
    }

    private func setupPostView(){
        addSubview(postView)
        postView.translatesAutoresizingMaskIntoConstraints = false
        postView.topAnchor.constraint(equalTo:postTitle.bottomAnchor, constant: 0.5).isActive = true
            postView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
            postView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
            postView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    

    

}
