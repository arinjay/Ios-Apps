//
//  roundButtonClass.swift
//  Quizzler
//
//  Created by Arinjay on 28/10/17.
//  Copyright © 2017 London App Brewery. All rights reserved.
//

import UIKit

@IBDesignable
class roundButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
}



