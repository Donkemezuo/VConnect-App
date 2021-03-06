//
//  TimelineDetailViewController.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 2/25/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class TimelineDetailViewController: UIViewController {
    
    private var news: News!
    private var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView()
    let detailView = TimeLineDetailView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailView)
        setUpDetailView()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "iPhone 8")!)
        
    }
    init(news: News) {
        super.init(nibName: nil, bundle: nil)
        self.news = news
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
   
    private func startLoading(){
        activityIndicator.center = detailView.newsImage.center
        activityIndicator.hidesWhenStopped =  true
        activityIndicator.style = UIActivityIndicatorView.Style.gray
        detailView.newsImage.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
    }
    
    private func stopLoading(){
        activityIndicator.stopAnimating()
        UIApplication.shared.endIgnoringInteractionEvents()
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
    detailView.newsDescription.text = news.details
        startLoading()
        if let imageurl = news.newsImage {
              newsImage(imageUrl: imageurl, imageView: detailView.newsImage)
            stopLoading()

        } else {
            detailView.newsImage.image = UIImage.init(named: "newslogo")
        }
    }

    

    
  

}
