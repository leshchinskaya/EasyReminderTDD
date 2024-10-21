//
//  Strategy.swift
//  EasyReminderTDDUITests
//
//  Created by Maria Leshchinskaya on 21.10.2024.
//  Copyright © 2024 Mariya. All rights reserved.
//

import XCTest

protocol InputStrategy {
    func inputReminderTitle(_ title: String)
    func openDetailReminder()
}

class SimpleInputStrategy: InputStrategy {
    private let app: XCUIApplication

    init(app: XCUIApplication) {
        self.app = app
    }

    func openDetailReminder() {
        app.buttons["addButton"].tap()
    }
    
    func inputReminderTitle(_ title: String) {
        let titleField = app.textFields["titleTextField"]
        titleField.tap()
        titleField.typeText(title)
    }
}

class AdvancedInputStrategy: InputStrategy {
    private let app: XCUIApplication

    init(app: XCUIApplication) {
        self.app = app
    }
    
    func openDetailReminder() {
        _ = app.buttons["addButton"].waitForExistence(timeout: 3)
        app.buttons["addButton"].tap()
    }

    func inputReminderTitle(_ title: String) {
        let titleField = app.textFields["titleTextField"]
        _ = titleField.waitForExistence(timeout: 3)
        titleField.tap()
        titleField.typeText(title)
    }
}

