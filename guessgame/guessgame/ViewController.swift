//
//  ViewController.swift
//  guessgame
//
//  Created by Arinjay on 01/08/16.
//  Copyright © 2016 Arinjay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet var userGuessTextField: UITextField!
    
    @IBOutlet var resultLabel: UILabel!
    
    @IBAction func guess(sender: AnyObject) {
        
        let diceRoll = String(arc4random_uniform(6))
        
        print(diceRoll)
        
        if diceRoll == userGuessTextField.text{
            resultLabel.text = "you're right"
        }
        else{
            resultLabel.text = "Wrong! it was "  + diceRoll
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

