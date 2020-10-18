//
//  ADLabel.swift
//  Dictionary
//
//  Created by admin on 23/09/2020.
//  Copyright © 2020 Last Destroyer. All rights reserved.
//

import UIKit

@IBDesignable
class ADLabel: UILabel {
    @IBInspectable var toBounds:Bool = false {
        didSet {
            layer.masksToBounds = toBounds
        }
    }
    @IBInspectable var borderWidth:Double = 0.0 {
        didSet {
            layer.borderWidth = CGFloat(borderWidth)
        }
    }
    @IBInspectable var borderColor:UIColor! {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var cornerRadius:Double = 0.0 {
        didSet {
            layer.cornerRadius = CGFloat(cornerRadius)
        }
    }
}
