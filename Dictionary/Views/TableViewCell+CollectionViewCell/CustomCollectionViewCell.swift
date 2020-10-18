//
//  CustomCollectionViewCell.swift
//  Dictionary
//
//  Created by admin on 06/10/2020.
//  Copyright © 2020 Last Destroyer. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var titleCell: UILabel!
    
    func customCollectionViewCell(imageName:String, title:String){
        
        imageCell.image = UIImage(named: imageName)
        imageCell.contentMode = UIView.ContentMode.scaleAspectFit
        
        titleCell.text = title
        titleCell.textAlignment = .left
        titleCell.font = UIFont(name: "Avenir-Heavy", size: 18)
        
    }
    
    
}
