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
    private var usersession: UserSession!
    private var imagePicker: UIImagePickerController!
    private var barbuttonItem:UIBarButtonItem!
    private var tap:UITapGestureRecognizer!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(signInPage)
        view.backgroundColor = UIColor.red
        navigationItem.title = "PROFILE"
        settingButton()
        setupProfileImage()
        usersession = (UIApplication.shared.delegate as! AppDelegate).usersession
        usersession.userSessionSignOutDelegate = self
         logOut()
        
    }
    
    private func settingButton(){
    
        barbuttonItem = UIBarButtonItem.init(image: UIImage.init(named: "icons8-settings"), style: .plain, target: self, action: #selector(setProfile))
        navigationItem.leftBarButtonItem = barbuttonItem
    }
    
    private func logOut(){
        barbuttonItem = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(logOutButtonPressed))
        navigationItem.rightBarButtonItem = barbuttonItem
    }
    
    @objc private func logOutButtonPressed(){
        usersession.logOut()
    }
    
    @objc private func setProfile(){
        
        let storybooard = UIStoryboard(name: "Main", bundle: nil)
        let profileTVC = storybooard.instantiateViewController(withIdentifier: "ProfileTableViewController")
        navigationController?.pushViewController(profileTVC, animated: true)
    }
    
    private func setupProfileImage(){
        signInPage.profileImage.isUserInteractionEnabled = true
        tap = UITapGestureRecognizer(target: self, action: #selector(imageLibrayAccess))
        signInPage.profileImage.addGestureRecognizer(tap)
    }
    
    
    @objc private func imageLibrayAccess(){
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        if !UIImagePickerController.isSourceTypeAvailable(.camera) {
            UIImagePickerController.isSourceTypeAvailable(.photoLibrary)
        }
        present(imagePicker, animated: true, completion: nil)
    }

}

extension signedInViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
       signInPage.profileImage.image = image
        } else {
            print("No image")
        }

        dismiss(animated: true, completion: nil)

    }


}

extension signedInViewController: UserSessionSignOutDelegate {
    func didRecieveSignOutError(_ usersession: UserSession, error: Error) {
        print("Logout error: \(error)")
    }
    
    func didSignOutUser(_ usersession: UserSession) {
        let window = (UIApplication.shared.delegate as! AppDelegate).window
        let launchScreen = LaunchViewController()
        window?.rootViewController = launchScreen
    }
    
    
}

