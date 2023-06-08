//
//  NewReminderScreen.swift
//  EasyReminderTDDUITests
//
//  Created by leshchinskaya on 08.06.2023.
//  Copyright © 2023 Mariya. All rights reserved.
//

import XCTest

enum NewReminderScreen {
    enum Element {
        case titleTextField
        case descripTextView
    }

    static func get(_ element: Element) -> XCUIElement {
        switch element {
        case .titleTextField:
            return XCUIApplication().textFields["titleTextField"]
        case .descripTextView:
            return XCUIApplication().textViews["descripTextView"]
        }
    }
}
