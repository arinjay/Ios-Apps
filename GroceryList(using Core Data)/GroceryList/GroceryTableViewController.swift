//
//  GroceryTableViewController.swift
//  GroceryList
//
//  Created by Arinjay Sharma on 1/28/17.
//  Copyright © 2017 Arinjay Sharma. All rights reserved.
//

import UIKit

class GroceryTableViewController: UITableViewController {

    
    var Grocery = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
            self?.Grocery.append((z?.text)!)
            self?.tableView.reloadData()
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

        cell.textLabel?.text = self.Grocery[indexPath.row]

        return cell
    }
}
