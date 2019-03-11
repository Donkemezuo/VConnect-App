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
    var postBarbuttonItem = UIBarButtonItem()
    var cameraBarButtonItem = UIBarButtonItem()
    private var usersession: UserSession!
    
    private var placeholderText = "Write a post"
  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(postView)
        setupNavigationBarItems()
        view.backgroundColor =  #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).withAlphaComponent(0.5)
        postView.postView.delegate = self
        usersession = (UIApplication.shared.delegate as!
            AppDelegate).usersession
        setupCameraButton()
        setupPostBarButtonItem()
        
    }
    
    private func setupCameraButton(){
        cameraBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .camera, target: self, action: #selector(cameraButtonPressed))
    }
    
    @objc private func cameraButtonPressed(){
        
    }
    
    private func setupPostBarButtonItem(){
         postBarbuttonItem = UIBarButtonItem.init(title: "Post", style: .done, target: self, action: #selector(PostButtonPressed))
        postBarbuttonItem.isEnabled = true

    }
    
    private func setupNavigationBarItems(){
        //self.navigationItem.rightBarButtonItems = [postBarbuttonItem, cameraBarButtonItem]
        self.navigationItem.setRightBarButtonItems([postBarbuttonItem, cameraBarButtonItem], animated: true)
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
        let adMinPost = Post.init(postedBy: postersName, storyTitle: title, storyDetails: postDetails, postedDate: postedDate)
        DatabaseManager.createApostToDatabase(Post: adMinPost)
        let alert = UIAlertController.init(title: "Success", message: "Successfully created post to the timeline", preferredStyle: .alert)
        let action = UIAlertAction.init(title: "Thank you", style: .default) { (alert) in
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    

}

extension PostViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        postView.postView.becomeFirstResponder()
        if postView.postView.text == placeholderText {
            postView.postView.textColor = .black
            postView.postView.text = ""
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if postView.postView.text == "" {
            postView.postView.textColor = .lightGray
            postView.postView.text = placeholderText
        }
    }
}

