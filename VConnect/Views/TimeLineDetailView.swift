//
//  TimeLineDetailView.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 2/25/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class TimeLineDetailView: UIView {

    public lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = #colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1)
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
    
        
        return scrollView
    }()
    
    
    public lazy var newsImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.init(named: "newsLogo")
        return imageView
        
    }()
    
    public lazy var newsTitle: UILabel = {
        let title = UILabel()
        title.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        title.text = "This will be news title"
        title.font = UIFont.boldSystemFont(ofSize: 20)
        return title
    }()
    
    public lazy var newsDescription: UITextView = {
        let description = UITextView()
        description.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        description.text = "Swift is a high-level programming language developed by Apple and made available in 2014. It is designed for writing apps for Apple platforms, including macOS, iOS, tvOS, and watchOS.The Swift language is based on Objective-C, which was used for NeXTSTEP development in the 1980s, and later macOS and iOS. Swift has similar syntax and maintains the object-oriented features of Objective-C, but provides a more simplified programming experience. For example, Swift code is easier to read and write than Objective-C. It allows several common commands to be combined and does require semicolons (;) at the end of each statement.Additionally, Swift handles several programming obstacles automatically. For example, Swift:initializes variables before they are used handles  (NULL) values explicitly ensures array indices are in bounds prevents integers from overflowing their allotted memory manages memory automatically"
        return description
        
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
    
    private func  setConstrains() {
        addSubview(scrollView)
        scrollView.addSubview(newsImage)
        scrollView.addSubview(newsTitle)
        scrollView.addSubview(newsDescription)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        newsImage.translatesAutoresizingMaskIntoConstraints = false
        newsTitle.translatesAutoresizingMaskIntoConstraints = false
        newsDescription.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        
        newsImage.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        newsImage.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
         newsImage.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        newsImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        
        newsTitle.topAnchor.constraint(equalTo: newsImage.bottomAnchor).isActive = true
        newsTitle.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        newsTitle.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        newsTitle.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.08).isActive = true
        
        newsDescription.topAnchor.constraint(equalTo: newsTitle.bottomAnchor).isActive = true
        newsDescription.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        newsDescription.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        newsDescription.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
       
        
    }
    
}



