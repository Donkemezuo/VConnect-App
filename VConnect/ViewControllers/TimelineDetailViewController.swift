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
   
    let detailView = TimeLineDetailView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailView)
        setUpDetailView()
        // view.setGradientBackground(colorOne: UIColor.red.withAlphaComponent(0.7), colorTwo: UIColor.blue.withAlphaComponent(0.7), colorThree: UIColor.white.withAlphaComponent(0.7), colorFour: UIColor.brown.withAlphaComponent(0.7))
        
        var gradient: CAGradientLayer!
        
        let firstColor = UIColor.init(red: 0/255, green: 34/255, blue: 62/255, alpha: 1.0)
        let secondColor = UIColor.init(red: 255/255, green: 161/255, blue: 127/255, alpha: 1.0)
        gradient = CAGradientLayer()
        gradient.colors = [firstColor.cgColor, secondColor.cgColor]
        gradient.frame = view.bounds
        view.layer.insertSublayer(gradient, at: 0)

    }
    init(news: News) {
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
    detailView.newsDescription.text = news.details
        if let imageurl = news.newsImage {
              newsImage(imageUrl: imageurl, imageView: detailView.newsImage)

        } else {
            detailView.newsImage.image = UIImage.init(named: "newslogo")
        }
    }

    

    
  

}
