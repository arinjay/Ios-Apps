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
    
    var percentageLayer:CATextLayer!
    @IBInspectable var showPercentage:Bool = true {
        didSet {updateLayerproperties()}
    }
    
    @IBInspectable var percentagePosition = 100 {
        didSet {updateLayerproperties()}
    }
    
    @IBInspectable var percentageColor:UIColor = UIColor.white {
        didSet{updateLayerproperties()}
    }
    
    var lineWidth:CGFloat = 1
    
    override func layoutSubviews() {
        super.layoutSubviews()
        createChart()
    }
    
    func createChart(){
        layoutBackgroundLayer()
        layoutBackgroundImageLayer()
    }
    
    func layoutBackgroundLayer (){
        if backgroundLayer == nil {
            backgroundLayer = CAShapeLayer()
            layer.addSublayer(backgroundLayer)
        
            let rectangle = bounds.insetBy(dx: lineWidth / 2, dy: lineWidth / 2)
            let path = UIBezierPath(ovalIn: rectangle)
            
            backgroundLayer.path = path.cgPath
            backgroundLayer.fillColor = backgroundColor?.cgColor
            backgroundLayer.lineWidth = lineWidth
            
            backgroundLayer.frame = layer.bounds
            
            
        }
        
    }
    
    func layoutBackgroundImageLayer (){
        if backgroundImageLayer == nil {
            let imageMask = CAShapeLayer()
            let inset = lineWidth + 3
            let insetBounds = self.bounds
            let maskPath = UIBezierPath(ovalIn: insetBounds)
            imageMask.path = maskPath.cgPath
            imageMask.fillColor = UIColor.black.cgColor
            imageMask.frame = self.bounds
            
            
            backgroundImageLayer = CAShapeLayer()
            backgroundImageLayer.mask = imageMask
            backgroundImageLayer.frame = self.bounds
            backgroundImageLayer.contentsGravity = kCAGravityResizeAspectFill
            layer.addSublayer(backgroundImageLayer)
            
            
        }
    }
    
    func updateLayerproperties() {
        
        if backgroundImageLayer != nil {
            if let image = backgroundImage {
                backgroundImageLayer.contents = image.cgImage
            }
        }
        
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
