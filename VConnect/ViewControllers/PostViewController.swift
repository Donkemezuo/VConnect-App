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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(postView)
        view.backgroundColor = .green
        setupNavigationBarItem()
    }

    private func setupNavigationBarItem(){
        barButton = UIBarButtonItem.init(barButtonSystemItem: .done, target: self, action: #selector(cameraButtonPressed))
        navigationItem.rightBarButtonItem = barButton
        barButton.isEnabled = false
        
        
       barButton = UIBarButtonItem.init(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonPressed))
       navigationItem.leftBarButtonItem = barButton
    }

    
    @objc private func cameraButtonPressed(){
        // TODO:
        // implement data passage to the timeline through the database
        
        if !postView.postView.text.isEmpty == true {
            barButton.isEnabled = true
        }
    
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

