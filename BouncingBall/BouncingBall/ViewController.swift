//
//  ViewController.swift
//  BouncingBall
//
//  Created by Arinjay on 03/12/16.
//  Copyright © 2016 Arinjay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var groundView: UIView!
    
    // dynamic animator
    
    var animator:UIDynamicAnimator!
    var ball:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        ball = UIView(frame: CGRect(x: 100, y:100, width:50, height:50))
        ball.layer.cornerRadius = 25
        ball.backgroundColor = UIColor.red
        
        self.view.addSubview(ball)
        
        //initialising animator
        
        animator = UIDynamicAnimator(referenceView: self.view)    // view of viewcontroller is our reference view
    }

    
    
    func addGravity() {
        let gravity = UIGravityBehavior(items: [ball])
        animator.addBehavior(gravity)  //add to gravity
        
        addGravity()
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

