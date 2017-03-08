//
//  ItemDetailVs.swift
//  BucketList
//
//  Created by Arinjay Sharma on 2/19/17.
//  Copyright © 2017 Arinjay Sharma. All rights reserved.
//

import UIKit
import CoreData

class ItemDetailVs: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var thungImg: UIImageView!
    @IBOutlet weak var storePicker : UIPickerView!
    @IBOutlet weak var titleField : UITextField!
    @IBOutlet weak var PriceField : UITextField!
    @IBOutlet weak var detailField : UITextField!
    
    
    var stores = [Store]()
    var itemToEdit: Item?
    
    var imagePicker = UIImagePickerController()
    
    @IBAction func deletePressed(_ sender: UIBarButtonItem) {
    
        if itemToEdit != nil {
        context.delete(itemToEdit!)
        xy.saveContext()
        }
    
        _ = navigationController?.popViewController(animated: true)
    
    }
    
    
    @IBAction func addImage(_ sender: Any) {
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    @IBAction func savePressed(_ sender: UIButton) {
        
        var item: Item!
        
        let picture = Image(context: context)
        picture.image = thungImg.image
        //item.toImage? = picture
        
        //
        if itemToEdit == nil {
        //let item = Item(context: context)
            item = Item(context: context)
        }
        else{
            item = itemToEdit
           
        }
        item.toImage = picture
        
        if  let title = titleField.text {
            item.title = title
        }
        
        if let price = PriceField.text {
            //item.price = price  //cannot assign value of string to double
            item.price = (price as NSString).doubleValue
        }
        
        if let detail = detailField.text {
            item.details = detail
        }
        
        
        item.toStore = stores[storePicker.selectedRow(inComponent: 0)]
        xy.saveContext()
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    func loadItemData(){
        if let item = itemToEdit {
            titleField.text = item.title
            detailField.text = item.details
            PriceField.text = "\(PriceField.text)"
        
            
            thungImg.image = item.toImage?.image as? UIImage
        
            if let store = item.toStore{
                var index = 0
                repeat {
                    let s = stores[index]
                    if s.name == store.name {
                        storePicker.selectRow(index, inComponent: 0, animated: false)
                        break
                    }
                    index += 1
                }  while (index < stores.count)
            }
    }
}
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let img = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            thungImg.image = img
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let topItem = self.navigationController?.navigationBar.topItem{
        
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
        
        storePicker.delegate = self
        storePicker.dataSource = self
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        
        
        
//        
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
        if itemToEdit != nil{
            loadItemData()
        }

        
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
