//
//  TimeLineViewController.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 2/8/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class TimeLineViewController: UIViewController {
    let timelineView = TimelineView()
    private var barButton = UIBarButtonItem()
    private var postVC = PostViewController()
    private var tapGesture: UITapGestureRecognizer!
    private var news = [ArticleInfo](){
        didSet {
            DispatchQueue.main.async {
                self.timelineView.collectionView.reloadData()
            }
        }
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor =  UIColor.yellow
        self.view.addSubview(timelineView)
     
        timelineView.collectionView.delegate = self
        timelineView.collectionView.dataSource = self
        UserPost()
       newsSetup()
        setupBarButtonItem()
    }
    
   
    private func setupBarButtonItem(){
        barButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonPressed))
        navigationItem.leftBarButtonItem =  barButton
    }
    
    @objc private func cancelButtonPressed(){
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    private func newsSetup(){
        GlobalNewsAPIClient.globalNewsAPIClient { (error, news) in
            if let error = error {
                print("Error: \(error)")
            } else {
                if let news = news {
                    self.news = news
                }
            }
        }
    }
    private func UserPost() {
        
        timelineView.postButton.isUserInteractionEnabled = true
        tapGesture = UITapGestureRecognizer(target: self, action:#selector(buttonPressed))
        timelineView.postButton.addGestureRecognizer(tapGesture)
    
    }
    
    @objc private func buttonPressed(){
        navigationController?.pushViewController(postVC, animated: true)
        //navigationController?.present(postVC, animated: true, completion: nil)
        
        
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
}

extension TimeLineViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return news.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCell", for: indexPath) as? TimelineCollectionViewCell else {return UICollectionViewCell()}
        
        let trendingNews = news[indexPath.row]
        cell.textView.text = trendingNews.title
        cell.poster.text =  trendingNews.source.name
        if let imageurl = trendingNews.urlToImage {
        newsImage(imageUrl:imageurl , imageView: cell.imageView)
        }
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius =  5.0
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let trendingNews = news[indexPath.row]
        let destination = TimelineDetailViewController(news: trendingNews)
self.navigationController?.pushViewController(destination, animated: true)
        
    }
    
    
}
