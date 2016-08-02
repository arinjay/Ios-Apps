//
//  ViewController.swift
//  primenum
//
//  Created by Arinjay on 02/08/16.
//  Copyright © 2016 Arinjay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet var userTextField: UITextField!
    
    @IBOutlet var result: UILabel!
    
    @IBAction func submit(sender: AnyObject) {
        
        var a:Int = Int(userTextField.text!)!
        
        var flag = 0
        
        for var i = 2; i <= a / 2; i = i + 1{
            
            
            print(i)
            if a % i == 0 {
                flag = 1
            }
            
        }
        
        if flag == 0 {
            result.text = "its a prime number"
        }
        else{
            result.text = "Not a prime"
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

