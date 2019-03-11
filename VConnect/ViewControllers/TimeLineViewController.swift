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
    
    private var trendingNews = [News](){
        didSet {
            DispatchQueue.main.async {
                self.timelineView.collectionView.reloadData()
            }
        }
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
       // view.backgroundColor =  #colorLiteral(red: 0, green: 0.2202599049, blue: 0.1758075058, alpha: 1)
        //view.backgroundColor = UIColor(patternImage: UIImage(named: "iPhone 8")!)
        self.view.addSubview(timelineView)
        timelineView.collectionView.delegate = self
        timelineView.collectionView.dataSource = self
        UserPost()
        newsSetup()
        getPost()
        
//        var gradient: CAGradientLayer!
//
//        let firstColor = UIColor.init(red: 0/255, green: 34/255, blue: 62/255, alpha: 1.0)
//        let secondColor = UIColor.init(red: 255/255, green: 161/255, blue: 127/255, alpha: 1.0)
//        gradient = CAGradientLayer()
//        gradient.colors = [firstColor.cgColor, secondColor.cgColor]
//        gradient.frame = view.bounds
//        view.layer.insertSublayer(gradient, at: 0)
    }
    
   
    
    private func getPost(){
        DatabaseManager.firebaseDataBase.collection(DataBaseKeys.postCollectionKey).addSnapshotListener(includeMetadataChanges: true) {[weak self] (querysnapshot, error) in
            if let error = error {
                print("Error: \(error)")
            } else {
                if let snapshot = querysnapshot {
                    var postedNews = [Post]()
                    for document in snapshot.documents {
                        let news = Post.init(dict: document.data())
                        postedNews.append(news)
                        
                        let trendingNews = News.init(title: news.storyTitle, source: news.postedBy, newsImage: "", details: news.storyDetails)
                        self?.trendingNews.append(trendingNews)
                    }
                }
            }
        }
        
    }
    private func newsSetup(){
        GlobalNewsAPIClient.globalNewsAPIClient { (error, news) in
            if let error = error {
                print("Error: \(error)")
            } else {
                if let news = news {
                    for news in news {
                     let trendingNews = News.init(title:news.title , source: news.source.name, newsImage: news.urlToImage, details: news.content ?? "")
                        self.trendingNews.append(trendingNews)
                    }
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
    }
    
    private func newsImage(imageUrl: String,imageView: UIImageView){
        if let imageCached = ImageHelper.fetchImageFromCache(urlString: imageUrl) {
            imageView.image = imageCached
        } else {
        ImageHelper.fetchImage(urlString: imageUrl) { (error, UIImage) in
            if let error = error {
                print("Error: \(error)")
            } else if let imageData = UIImage {
                imageView.image = imageData
            }
        }
        }
    }
}

extension TimeLineViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trendingNews.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCell", for: indexPath) as? TimelineCollectionViewCell else {return UICollectionViewCell()}
        
        let news = trendingNews[indexPath.row]
        cell.textView.text = news.title
        cell.poster.text =  news.source
        if let Image = news.newsImage{
            newsImage(imageUrl: Image, imageView: cell.imageView)
        } else {
            cell.imageView.image = UIImage.init(named: "newsLogo")
        }
       
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius =  5.0
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let news = trendingNews[indexPath.row]
        let destination = TimelineDetailViewController(news: news)
self.navigationController?.pushViewController(destination, animated: true)
        
    }
    
    
}
