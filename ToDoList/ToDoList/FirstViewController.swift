//
//  FirstViewController.swift
//  ToDoList
//
//  Created by Arinjay on 08/08/16.
//  Copyright © 2016 Arinjay. All rights reserved.
//

import UIKit

var toDoList = [String]()

class FirstViewController: UIViewController, UITableViewDelegate {

    
    @IBOutlet var toDolistTable: UITableView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if NSUserDefaults.standardUserDefaults().objectForKey("toDoList") != nil {
        
        toDoList = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") as! [String]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return toDoList.count
        
    }
    
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier:"Cell")
        
        cell.textLabel?.text = toDoList[indexPath.row]
        
        return cell
    }
    
    
    override func viewDidAppear(animated: Bool) {
        
        toDolistTable.reloadData()
    }


}

