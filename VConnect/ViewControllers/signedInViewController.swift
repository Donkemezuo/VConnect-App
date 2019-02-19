//
//  SignInViewController.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 2/9/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class signedInViewController: UIViewController {
    let signInPage = SignInView()
    private var imagePicker: UIImagePickerController!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(signInPage)
        view.backgroundColor = UIColor.red
        setupSignIn()
        
    }
    
    
    private func setupSignIn(){
        signInPage.profileImage.addTarget(self, action: #selector(changeImage), for: .touchUpInside)
    }
    
    func imageLibrayAccess(){
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        if !UIImagePickerController.isSourceTypeAvailable(.camera) {
            UIImagePickerController.isSourceTypeAvailable(.photoLibrary)
        }
        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc private func changeImage(){
        
            let alert = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
        let photoAlert = UIAlertAction(title: "Photo Library", style: .default) { (alert: UIAlertAction) in
            
            self.imageLibrayAccess()
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (alert) in
            self.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(photoAlert)
        alert.addAction(cancel)

        present(alert, animated: true , completion: nil)
        
        
        
    }
    
    
    


}

extension signedInViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            signInPage.profileImage.setBackgroundImage(image, for: .normal)
        } else {
            print("No image")
        }
        
        dismiss(animated: true, completion: nil)

    }
    
    
}
