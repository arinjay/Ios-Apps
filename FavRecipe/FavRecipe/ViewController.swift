//
//  ViewController.swift
//  FavRecipe
//
//  Created by Arinjay on 23/10/16.
//  Copyright © 2016 Arinjay. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var recipes = [Recipe]()
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    override func viewDidAppear(animated: Bool) {
        fetchAndSetResult()
        tableView.reloadData()
    }

    func fetchAndSetResult(){
        
        let app = UIApplication.sharedApplication().delegate as! AppDelegate  // give you main delegate
        let context = app.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Recipe")
        do{
            let results = try context.executeFetchRequest(fetchRequest)
            self.recipes = results as! [Recipe]
            
        }
        catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //return UITableViewCell()
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("RecipeCell") as? RecipeCell{
            let recipe = recipes[indexPath.row]
            cell.configureCell(recipe)
            return cell
        }
        else{
            return RecipeCell()
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
}

