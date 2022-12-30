//
//  Clear.swift
//  EasyReminderTDDUITests1
//
//  Created by Егор Зайцев on 30.12.2022.
//  Copyright © 2022 Mariya. All rights reserved.
//

import Foundation
import XCTest
extension XCUIElement {
    
    func clearText() {
        
        //
        // cf. and tip courtesy of
        //    https://stackoverflow.com/questions/32821880/ui-test-deleting-text-in-text-field
        //
        guard let stringValue = self.value as? String else {
            return
        }
        // workaround for apple bug
        if let placeholderString = self.placeholderValue, placeholderString == stringValue {
            return
        }
        
        var deleteString = String()
        for _ in stringValue {
            deleteString += XCUIKeyboardKey.delete.rawValue
        }
        self.typeText(deleteString)
    }
    
    func typeTextAndPressEnter(_ text: String) {
        self.typeText("\(text)\n")
    }

}
