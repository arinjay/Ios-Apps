//
//  GroceryTableViewController.swift
//  GroceryList
//
//  Created by Arinjay Sharma on 1/28/17.
//  Copyright © 2017 Arinjay Sharma. All rights reserved.
//

import UIKit
import CoreData

class GroceryTableViewController: UITableViewController {

    
    //var Grocery = [String]()
    var Grocery = [NSManagedObject]()
    var managedObjectContext : NSManagedObjectContext?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedObjectContext = appDelegate.persistentContainer.viewContext
        
        
        
    }

    func loadData(){
        //let request = NSFetchRequest<NSManagedObject> = NSFetchRequest(entityName: "Grocery")
        let request : NSFetchRequest<NSManagedObject> = NSFetchRequest(entityName: "Grocery")
        
        do {
            let result = try managedObjectContext?.fetch(request)
            Grocery = result!
            tableView.reloadData()
        }
        catch{
        fatalError("Error")
        }
        tableView.reloadData()
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func AddAction(_ sender: UIBarButtonItem) {
        
        //
        let alertController = UIAlertController(title: "add TExt", message: "Add the Items", preferredStyle:
            UIAlertControllerStyle.alert)
        
        alertController.addTextField { (textField:UITextField) in
        }
            let add = UIAlertAction(title: "Add", style: UIAlertActionStyle.default) { [weak self] (action:UIAlertAction) in
            
            let z = alertController.textFields?.first
                
            let entity = NSEntityDescription.entity(forEntityName: "Grocery", in: (self?.managedObjectContext)!)
                
            let grocery = NSManagedObject(entity: entity!, insertInto: self?.managedObjectContext)
            
            grocery.setValue(z!.text!, forKey: "item")
                
                do {
                    try self?.managedObjectContext?.save()
                }
                catch{fatalError("Error")
                
                
            //self?.Grocery.append((z?.text)!)
            //self?.tableView.reloadData()
        }
        self?.loadData()
    }
                                                                //error only.default
            let cancel = UIAlertAction(title: "cancel", style: UIAlertActionStyle.default, handler: nil)
            alertController.addAction(add)
            alertController.addAction(cancel)
        
        
        present(alertController, animated: true, completion: nil)
        
    
    
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return Grocery.count
        return self.Grocery.count
    }

   
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {                                                       // did'nt add the identifier name at rableviewcell
        let cell = tableView.dequeueReusableCell(withIdentifier: "Grocery", for: indexPath)

        //cell.textLabel?.text = self.Grocery[indexPath.row]

        let grocery = self.Grocery[indexPath.row]
        cell.textLabel?.text = grocery.value(forKey: "item") as? String
        return cell
    }
}
