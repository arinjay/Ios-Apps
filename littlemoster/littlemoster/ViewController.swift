//
//  ViewController.swift
//  littlemoster
//
//  Created by Arinjay on 02/10/16.
//  Copyright © 2016 Arinjay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var monsterImg: MonsterImg!
    @IBOutlet weak var foodImg: DragImage!
    @IBOutlet weak var heartImg: DragImage!
    

    
    override func viewDidLoad() {
                super.viewDidLoad()
        
        
        foodImg.dropTarget = monsterImg
        heartImg.dropTarget = monsterImg

        
//     NSNotificationCenter.defaultCenter().addObserver(self, selector: "itemDroppedcharacter", name: "onTargetDropped", object: nil )
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "itemDroppedOnCharacter:", name: "onTargetDropped", object: nil)
        
        
    }
    
    func itemDroppedOnCharacter(notif: AnyObject){
        
        print("item dropped on character")
    }


}

