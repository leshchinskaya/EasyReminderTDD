//
//  AccessibillityIds.swift
//  EasyReminderTDDUITests
//
//  Created by pozhidaev on 07.06.2023.
//  Copyright © 2023 Mariya. All rights reserved.
//

import Foundation
import XCTest

let app = XCUIApplication()

//public let descriptions = XCUIApplication().children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element

public let datePicker = XCUIApplication()/*@START_MENU_TOKEN@*/.datePickers/*[[".otherElements[\"Preview\"].datePickers",".datePickers"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/

public let backs = app.navigationBars["EasyReminderTDD.NewReminderView"].buttons["Easy Reminder"]

public enum AccessibilityIDs {
    
    public enum Main {
        
        public static let addButton = "AddId"
        
        public static let showClosedButton = "ShowClosedButtonId"
        
        public static let checkBox = "CheckId"
        
        public static let datelabel = "DateLabelId"
    }
    
    public enum AddNewTask {
        
        public static let title = "TitleId"
        
        public static let location = "LocationId"
        
        public static let description = "description"
        
        public static let datepicker = String(describing: datePicker)
        
        public static let back = String(describing: backs)
        
        public static let date = "DateId"
        
        public static let myDate = "myDate"
        
        public static let priority = "priority"
    }
}
