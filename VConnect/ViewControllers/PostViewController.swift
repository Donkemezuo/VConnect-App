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
    private let usersession = (UIApplication.shared.delegate as! AppDelegate).usersession
  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(postView)
        view.backgroundColor = .green
        setupNavigationBarItem()
        
        var gradient: CAGradientLayer!
        
        let firstColor = UIColor.init(red: 0/255, green: 34/255, blue: 62/255, alpha: 1.0)
        let secondColor = UIColor.init(red: 255/255, green: 161/255, blue: 127/255, alpha: 1.0)
        gradient = CAGradientLayer()
        gradient.colors = [firstColor.cgColor, secondColor.cgColor]
        gradient.frame = view.bounds
        view.layer.insertSublayer(gradient, at: 0)
    }
    
    private func setupNavigationBarItem(){
        barButton = UIBarButtonItem.init(title: "Post", style: .done, target: self, action: #selector(PostButtonPressed))
        navigationItem.rightBarButtonItem = barButton
        barButton.isEnabled = true
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
        barButton.isEnabled = true
    }
}

