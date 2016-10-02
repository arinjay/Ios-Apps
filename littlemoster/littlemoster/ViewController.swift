//
//  ViewController.swift
//  littlemoster
//
//  Created by Arinjay on 02/10/16.
//  Copyright © 2016 Arinjay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var monsterImg: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var imgArray = [UIImage]()
            for var x = 1; x <= 4; x++ {
                var img = UIImage(named: "idle\(x).png")
                imgArray.append(img!)
            }
        
        monsterImg.animationImages = imgArray
        monsterImg.animationDuration = 0.8
        monsterImg.animationRepeatCount = 0
        monsterImg.startAnimating()
        
    
    }

    


}

