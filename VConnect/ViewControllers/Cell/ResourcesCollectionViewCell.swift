//
//  ResourcesCollectionViewCell.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 2/8/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class ResourcesCollectionViewCell: UICollectionViewCell {
    let label: UILabel = {
    let names = UILabel()
        //names.font = UIFont.italicSystemFont(ofSize: 20)
        names.font = UIFont(name: "Georgia-Bold", size: 24)
        return names
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
    private func setConstrains(){
        addSubview(label)
    label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
}
}
