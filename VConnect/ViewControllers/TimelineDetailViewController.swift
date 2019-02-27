//
//  TimelineDetailViewController.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 2/25/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class TimelineDetailViewController: UIViewController {
    
    private var news: ArticleInfo!
   
    let detailView = TimeLineDetailView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailView)
        setUpDetailView()

    }
    init(news: ArticleInfo) {
        super.init(nibName: nil, bundle: nil)
        self.news = news
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    private func newsImage(imageUrl: String,imageView: UIImageView){
        ImageHelper.fetchImage(urlString: imageUrl) { (error, UIImage) in
            if let error = error {
                print("Error: \(error)")
            } else if let imageData = UIImage {
                imageView.image = imageData
                
            }
        }
        
    }
    
    private func setUpDetailView(){
    detailView.newsTitle.text = news.title
    detailView.newsDescription.text = news.content
        newsImage(imageUrl: news.urlToImage!, imageView: detailView.newsImage)
        
    
        
    }

    

    
  

}
