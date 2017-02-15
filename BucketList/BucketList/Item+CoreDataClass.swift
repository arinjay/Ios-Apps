//
//  Item+CoreDataClass.swift
//  BucketList
//
//  Created by Arinjay Sharma on 2/15/17.
//  Copyright © 2017 Arinjay Sharma. All rights reserved.
//

import Foundation
import CoreData


public class Item: NSManagedObject {

    public override func awakeFromInsert() {
        super.awakeFromInsert()
        self.created = NSDate()
    }
}
