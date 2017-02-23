//
//  MainVC.swift
//  BucketList
//
//  Created by Arinjay Sharma on 2/15/17.
//  Copyright © 2017 Arinjay Sharma. All rights reserved.
//

import UIKit
import CoreData

class MainVC: UIViewController,UITableViewDelegate,UITableViewDataSource,NSFetchedResultsControllerDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segment: UISegmentedControl!
    
    var Controller: NSFetchedResultsController<Item>!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView.delegate = self
        tableView.dataSource = self
        
        generateData()
        attempptFetch()
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = Controller.sections{
            let sectioninfo =  sections[section]
            return sectioninfo.numberOfObjects
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
        
       // return UITableViewCell()
        return cell
    }
    
    func configureCell(cell: ItemCell, indexPath: NSIndexPath){
        //update cell
        let item = Controller.object(at: indexPath as IndexPath)
        cell.configureCell(item:item)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let sections = Controller.sections{
            return sections.count
        }
        return 0
    }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 148
    }
    
    

    func attempptFetch(){
        let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
        let dateSort = NSSortDescriptor(key: "created", ascending: false)
        
        fetchRequest.sortDescriptors = [dateSort]
        
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        self.Controller = controller
        controller.delegate = self
        
        do {
            try controller.performFetch()
            
        }catch{
            let error = error as NSError
            print("\(error)")
        }
    }

    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    

    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch(type) {
            
        case.insert:
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .fade)
            }
        break
            
        case.delete:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            break
            
        case.update:
            if let indexPath = indexPath {
                let cell = tableView.cellForRow(at: indexPath) as! ItemCell
                
                configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
            }
            break
            
        case.move:
            if let indexPath = indexPath{
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            
            if let indexPath = newIndexPath{
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break
        }
        
    }
    
    
    func generateData(){
        let item = Item(context: context)
        item.title = "MacBook air"
        item.price = 1000
        item.details = "Will buy this one before 2017"
        
        let item3 = Item(context: context)
        item3.title = "Jaguar"
        item3.price = 15000
        item3.details = "Get this beast before 2020."
        
        let item2 = Item(context: context)
        item2.title = "MacBook Pro"
        item2.price = 1500
        item2.details = "Awesome"
        
        xy.saveContext()
        
    }

}




