//
//  Reminder+CoreDataClass.swift
//  EasyReminderTDD
//
//  Created by Marie on 05.01.18.
//  Copyright © 2018 Mariya. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Reminder)
public class Reminder: NSManagedObject {
    convenience init() {
        self.init(entity: CoreDataManager.instance.entityForName(entityName: "Reminder"), insertInto: CoreDataManager.instance.managedObjectContext)
    }
}
