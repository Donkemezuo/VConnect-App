//
//  PostViewController.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 2/16/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit
import Toucan

class PostViewController: UIViewController {
    let postView = PostView()
    var postBarbuttonItem = UIBarButtonItem()
    var cameraBarButtonItem = UIBarButtonItem()
    
    private var imagePickerController: UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        return imagePicker
    }
    private var usersession: UserSession!
    private var selectedImage:UIImage?
    
    private var placeholderText = "Write a post"
  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(postView)
        view.backgroundColor =  #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).withAlphaComponent(0.5)
        postView.postView.delegate = self
        usersession = (UIApplication.shared.delegate as!
            AppDelegate).usersession
        setupPostBarButtonItem()
        configureToolBar()
    }

    private func setupPostBarButtonItem(){
         postBarbuttonItem = UIBarButtonItem.init(title: "Post", style: .done, target: self, action: #selector(PostButtonPressed))
        postBarbuttonItem.isEnabled = true
        navigationItem.rightBarButtonItem = postBarbuttonItem

    }
  
    @objc private func PostButtonPressed(){
        guard let postTitle = postView.postTitle.text, let postDetails = postView.postView.text,
            !postTitle.isEmpty,
            !postDetails.isEmpty,
        let imageData = selectedImage?.jpegData(compressionQuality: 1.0)
            else {
                showAlert(title: "Missing Fields", message: "Cannot post to timeline without title or post details")
                return
        }
        guard let currentUser = usersession?.getCurrentUser(), let postersName = currentUser.displayName else {
            
            showAlert(title: "Error", message: "Only users with account can write a post")
            
            return}
        let docRef = DatabaseManager.firebaseDataBase.collection(DataBaseKeys.postCollectionKey).document()
        
        StorageService.postImage(imageData: imageData, imageName:PostCollects.imageURL + "\(currentUser.uid) /\(docRef.documentID)") {[weak self] (error, imageURL) in
            if let error = error {
             self?.showAlert(title: "Error: Failed to post image", message: error.localizedDescription)
            } else {
                if let imageURL = imageURL{
                    let adminPost = Post.init(postedBy: postersName, storyTitle: postTitle, storyDetails: postDetails, postedDate: Date.getISOTimestamp(), imageURL: imageURL.absoluteString, documentID: docRef.documentID)
                        
                    DatabaseManager.createApostToDatabase(Post: adminPost)
                }
            }
        }
    
        navigationItem.rightBarButtonItem?.isEnabled = false
        let alert = UIAlertController.init(title: "Success", message: "Successfully created post to the timeline", preferredStyle: .alert)
        let action = UIAlertAction.init(title: "Thank you", style: .default) { (alert) in
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    private func configureToolBar(){
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 44))
        let cameraBarItem = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(cameraButtonPressed))
        
        let photoLibraryBarItem = UIBarButtonItem(title: "Photo Library", style: .plain, target: self, action: #selector(photoLibraryButtonPressed))
        let flexibleSpaceBarItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.items = [cameraBarItem, flexibleSpaceBarItem, photoLibraryBarItem]
        if !UIImagePickerController.isSourceTypeAvailable(.camera) {
            cameraBarItem.isEnabled = false
        }
        postView.postTitle.inputAccessoryView = toolbar
        postView.postView.inputAccessoryView = toolbar
    }
    
    @objc private func cameraButtonPressed(){
        imagePickerController.sourceType = .camera
        present(imagePickerController, animated: true)
    }
    
    @objc private func photoLibraryButtonPressed(){
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true)
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

extension PostViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {return}
        let resizedImage = Toucan.init(image: originalImage).resize(CGSize(width: 500, height: 500))
        selectedImage = resizedImage.image
        postView.postImageView.image = resizedImage.image
        dismiss(animated: true)
    }
    
}

