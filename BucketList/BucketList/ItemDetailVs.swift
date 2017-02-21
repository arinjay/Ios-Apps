//
//  ItemDetailVs.swift
//  BucketList
//
//  Created by Arinjay Sharma on 2/19/17.
//  Copyright © 2017 Arinjay Sharma. All rights reserved.
//

import UIKit

class ItemDetailVs: UIViewController {

    @IBOutlet weak var storePicker : UIPickerView!
    @IBOutlet weak var titleField : CustomTextField!
    @IBOutlet weak var PriceField : CustomTextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let topItem = self.navigationController?.navigationBar.topItem{
        
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
    }
}
