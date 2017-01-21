//
//  ViewController.swift
//  PresentationControllerBasic
//
//  Created by Arinjay Sharma on 1/21/17.
//  Copyright © 2017 Arinjay Sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func showDetail(_ sender: Any) {
        
        let sb = UIStoryboard (name: "Main", bundle: nil)
        
        let detailVc = sb.instantiateViewController(withIdentifier: "detail") as! DetailViewController
        
        detailVc.modalPresentationStyle = .popover
        
        let detailpopover = detailVc.popoverPresentationController!
        
        let sourceButton = sender as! UIBarButtonItem
        
        detailpopover.barButtonItem = sourceButton
        detailpopover.permittedArrowDirections = .any
        
        self.present(detailVc, animated: true, completion: nil)
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

