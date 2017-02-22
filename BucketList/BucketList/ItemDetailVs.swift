//
//  ItemDetailVs.swift
//  BucketList
//
//  Created by Arinjay Sharma on 2/19/17.
//  Copyright © 2017 Arinjay Sharma. All rights reserved.
//

import UIKit
import CoreData

class ItemDetailVs: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

    @IBOutlet weak var storePicker : UIPickerView!
    @IBOutlet weak var titleField : UITextField!
    @IBOutlet weak var PriceField : UITextField!
    @IBOutlet weak var detailField : UITextField!
    
    
    var stores = [Store]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let topItem = self.navigationController?.navigationBar.topItem{
        
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
        
        storePicker.delegate = self
        storePicker.dataSource = self
        
//        let store = Store(context: context)
//        store.name = "Amazon"
//        let store1 = Store(context: context)
//        store1.name = "Flipkart"
//        let store2 = Store(context: context)
//        store2.name = "AliExpress"
//        let store3 = Store(context: context)
//        store3.name = "Ebay"
//        let store4 = Store(context: context)
//        store4.name = "Jabong"
//
//        
//        xy.saveContext()
        getStores()

        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        let store = stores[row]
        return store.name
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stores.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // update when selected
    }
    
    func getStores(){
        let fetchRequest : NSFetchRequest<Store> = Store.fetchRequest()
        do{
            self.stores = try context.fetch(fetchRequest)
            self.storePicker.reloadAllComponents()
        }
        catch{
            
        }
    }
    
}
