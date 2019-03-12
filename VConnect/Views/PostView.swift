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
            postTitle.placeholder = "Please Enter a Title"
            //postTitle.font = UIFont.boldSystemFont(ofSize: 20)
            postTitle.font = UIFont.init(name: "Georgia", size: 20)
            postTitle.textColor = .black
            postTitle.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        return postTitle
    }()
    public lazy var postView: UITextView = {
        let postView = UITextView()
        postView.text = "Write a Post"
        postView.textColor = .black
//        postView.font = UIFont.boldSystemFont(ofSize: 20)
        postView.font = UIFont.init(name: "Georgia", size: 20)
        postView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        return postView
        
    }()
    
    public lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
            imageView.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
            imageView.image = UIImage.init(named: "newsLogo")
        return imageView
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
        setupPostImageView()
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
        postView.heightAnchor.constraint(equalToConstant: 360).isActive = true
    }
    private func setupPostImageView(){
        addSubview(postImageView)
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        postImageView.topAnchor.constraint(equalTo: postView.bottomAnchor).isActive = true
        postImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
         postImageView.trailingAnchor.constraint(equalTo: leadingAnchor, constant: -11).isActive = true
        postImageView.heightAnchor.constraint(equalToConstant: 350).isActive = true
        postImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    

    

}
