//
//  SignUpView.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 2/9/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class SignUpView: UIView {

    let organizationInfo: UILabel = {
        let label = UILabel()
        label.text = "Organization Information"
        label.font = UIFont.italicSystemFont(ofSize: 15)
        label.backgroundColor = UIColor.gray.withAlphaComponent(0.8)
        return label
    }()
    
    let organizationName: UITextField = {
        let organizationNameInput = UITextField()
            organizationNameInput.backgroundColor = UIColor.white.withAlphaComponent(0.8)
            organizationNameInput.placeholder = "Organization Name*"
            organizationNameInput.textAlignment = .center
            organizationNameInput.layer.cornerRadius = 5.0
        
        return organizationNameInput

    }()
    
    let organizationAcronomy: UITextField = {
        let acronomy = UITextField()
            acronomy.placeholder = "Acronomy*"
            acronomy.textAlignment = .center
            acronomy.layer.cornerRadius = 5.0
            acronomy.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        return acronomy
    }()
    
    let organizationPhone: UITextField = {
        let phoneNumber = UITextField()
            phoneNumber.placeholder = "Phone Number*"
            phoneNumber.textAlignment = .center
            phoneNumber.layer.cornerRadius = 5.0
            phoneNumber.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        
        return phoneNumber
    }()
    
    let organizationEmail: UITextField = {
        let email = UITextField()
            email.placeholder = "Email*"
            email.textAlignment = .center
            email.layer.cornerRadius = 5.0
            email.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        return email
    }()
    
    let label: UILabel = {
        let addressLabel = UILabel()
        addressLabel.text = "Address"
        addressLabel.font = UIFont.italicSystemFont(ofSize: 20)
        addressLabel.backgroundColor = UIColor.gray.withAlphaComponent(0.8)
        
        return addressLabel
    }()
    
    let organizationStreet: UITextField = {
        let streetName = UITextField()
            streetName.placeholder = "Street Name"
            streetName.textAlignment = .center
            streetName.layer.cornerRadius = 5.0
            streetName.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        return streetName
        
    }()
    
    let organizationPostalCode: UITextField = {
        let postalCode = UITextField()
        postalCode.placeholder = "Postal Code"
        postalCode.textAlignment = .center
        postalCode.layer.cornerRadius = 5.0
        postalCode.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        return postalCode
    }()
    
    let organizationCity: UITextField = {
        let cityName =  UITextField()
            cityName.placeholder = "CityName"
        cityName.textAlignment = .center
         cityName.layer.cornerRadius = 5.0
        cityName.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        return cityName
    }()
    
    let organizationState: UITextField = {
        let stateName = UITextField()
            stateName.placeholder = "State"
        stateName.textAlignment = .center
        stateName.layer.cornerRadius = 5.0
        stateName.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        return stateName
        
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInt()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInt()
    }
    private func commonInt(){
        setConstrains()
    }

    private func  setConstrains(){
        addSubview(organizationInfo)
        addSubview(organizationName)
        addSubview(organizationAcronomy)
        addSubview(organizationPhone)
        addSubview(organizationEmail)
        addSubview(label)
        addSubview(organizationState)
        addSubview(organizationStreet)
        addSubview(organizationCity)
        addSubview(organizationPostalCode)
        organizationInfo.translatesAutoresizingMaskIntoConstraints = false
        organizationName.translatesAutoresizingMaskIntoConstraints = false
        organizationAcronomy.translatesAutoresizingMaskIntoConstraints = false
        organizationPhone.translatesAutoresizingMaskIntoConstraints = false
        organizationEmail.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        organizationPostalCode.translatesAutoresizingMaskIntoConstraints = false
        organizationCity.translatesAutoresizingMaskIntoConstraints = false
        organizationStreet.translatesAutoresizingMaskIntoConstraints = false
        organizationState.translatesAutoresizingMaskIntoConstraints = false
        organizationPostalCode.translatesAutoresizingMaskIntoConstraints = false
        
        organizationInfo.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        organizationInfo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        organizationInfo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -230).isActive = true
        organizationInfo.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -640).isActive = true
        
        organizationName.topAnchor.constraint(equalTo: organizationInfo.bottomAnchor, constant: 5).isActive = true
        organizationName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        organizationName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -190).isActive = true
        organizationName.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -595).isActive = true
        
        organizationAcronomy.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 38).isActive = true
        organizationAcronomy.leadingAnchor.constraint(equalTo: organizationName.trailingAnchor, constant: 5).isActive = true
        organizationAcronomy.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        organizationAcronomy.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -595).isActive = true
        
        organizationPhone.topAnchor.constraint(equalTo: organizationName.bottomAnchor, constant: 5).isActive = true
        organizationPhone.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        organizationPhone.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -190).isActive = true
        organizationPhone.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -550).isActive = true
        
        organizationEmail.topAnchor.constraint(equalTo: organizationAcronomy.bottomAnchor, constant: 5).isActive = true
        organizationEmail.leadingAnchor.constraint(equalTo: organizationPhone.trailingAnchor, constant: 5).isActive = true
        organizationEmail.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        organizationEmail.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -550).isActive = true
        
        label.topAnchor.constraint(equalTo: organizationEmail.bottomAnchor, constant: 10).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -230).isActive = true
        label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -520).isActive = true
    }
    
    
    
    
}
