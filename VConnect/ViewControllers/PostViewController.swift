//
//  PostViewController.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 2/16/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {
    let postView = PostView()
    var barButton = UIBarButtonItem()
   // private var  usersession: UserSession!
    
    private let usersession = (UIApplication.shared.delegate as! AppDelegate).usersession
   // private var imageData: Data?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(postView)
        view.backgroundColor = .green
        setupNavigationBarItem()
    }
    
    private func setupNavigationBarItem(){
        barButton = UIBarButtonItem.init(title: "Post", style: .done, target: self, action: #selector(PostButtonPressed))
        navigationItem.rightBarButtonItem = barButton
        barButton.isEnabled = true
       barButton = UIBarButtonItem.init(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonPressed))
       navigationItem.leftBarButtonItem = barButton
    }
    
    @objc private func PostButtonPressed(){
     
        guard let title = postView.postTitle.text, let postDetails = postView.postView.text,
            !title.isEmpty,
            !postDetails.isEmpty
            else {
                showAlert(title: "Missing Fields", message: "Cannot post to timeline without title or post details")
                return
                
        }
        
        guard let currentUser = usersession?.getCurrentUser(), let postersName = currentUser.displayName else {return}
        let date = Date()
        let formatter = DateFormatter()
        formatter.date(from: "dd.MM.yyyy")
        let postedDate = formatter.string(from: date)
        let adMinPost = Post.init(poster: postersName, storyTitle: title, storyDetails: postDetails, postedDate: postedDate)
        print(" Posted date is = \(postedDate)")
        DatabaseManager.createApostToDatabase(Post: adMinPost)
        showAlert(title: "Success", message: "Successfully created post to the timeline")
    }
    
    @objc private func cancelButtonPressed(){
       self.dismiss(animated: true, completion: nil)
    }

}

extension PostViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        postView.postView.becomeFirstResponder()
        barButton.isEnabled = true
    }
}

