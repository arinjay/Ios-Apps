//
//  Ibdesignables.swift
//  UX
//
//  Created by Arinjay Sharma on 5/9/17.
//  Copyright © 2017 Arinjay Sharma. All rights reserved.
//

import UIKit

@IBDesignable class Ibdesignables: UIButton {
    
    @IBInspectable var borderwidth: CGFloat =  0.0 {
        didSet {
            
            self.layer.borderWidth = borderwidth
        }
    }
    
    
    @IBInspectable var bordercolor: UIColor = UIColor.clear {
        didSet {
                    // color
           self.layer.borderColor = bordercolor.cgColor
        }
    }
    
    
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
}
