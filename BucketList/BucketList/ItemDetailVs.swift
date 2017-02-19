//
//  ItemDetailVs.swift
//  BucketList
//
//  Created by Arinjay Sharma on 2/19/17.
//  Copyright © 2017 Arinjay Sharma. All rights reserved.
//

import UIKit

class ItemDetailVs: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if let topItem = self.navigationController?.navigationBar.topItem{
        
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
    }

    

   

}
