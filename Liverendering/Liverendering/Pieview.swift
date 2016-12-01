//
//  Pieview.swift
//  Liverendering
//
//  Created by Arinjay on 02/12/16.
//  Copyright © 2016 Arinjay. All rights reserved.
//

import UIKit
@IBDesignable
class Pieview: UIView {

    var backgroundLayer: CAShapeLayer!
    @IBInspectable var backgroundLayerColor:UIColor =  UIColor.darkGray {
        didSet { updateLayerproperties()}
    }
    
    var backgroundImageLayer:CALayer!
    @IBInspectable var backgroundImage: UIImage?{
        didSet { updateLayerproperties()}
    }
    
    var ringLayer:CAShapeLayer!
    @IBInspectable var ringThickness:CGFloat = 2
    @IBInspectable var ringColor:UIColor = UIColor.blue
    @IBInspectable var ringprogress:CGFloat = 0.75 {
        didSet {updateLayerproperties()}
    }
    
    var 
    
    
    
    func updateLayerproperties() {
        
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
