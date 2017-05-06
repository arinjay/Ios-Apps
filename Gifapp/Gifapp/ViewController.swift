//
//  ViewController.swift
//  Gifapp
//
//  Created by Arinjay Sharma on 5/5/17.
//  Copyright © 2017 Arinjay Sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gifView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        gifView.loadGif(name: "gif")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

