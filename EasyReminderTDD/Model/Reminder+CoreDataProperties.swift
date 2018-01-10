//
//  Reminder+CoreDataProperties.swift
//  EasyReminderTDD
//
//  Created by Marie on 05.01.18.
//  Copyright © 2018 Mariya. All rights reserved.
//
//

import Foundation
import CoreData


extension Reminder {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Reminder> {
        return NSFetchRequest<Reminder>(entityName: "Reminder")
    }

    @NSManaged public var date: NSDate?
    @NSManaged public var descrip: String?
    @NSManaged public var location: String?
    @NSManaged public var precedence: Int16
    @NSManaged public var title: String?
    @NSManaged public var done: Bool

}
