//
//  Loadable.swift
//  EasyReminderTDDUITests
//
//  Created by Maria Leshchinskaya on 21.10.2024.
//  Copyright © 2024 Mariya. All rights reserved.
//

import XCTest

class ReminderLoadablePage {
    private let app: XCUIApplication

    init(app: XCUIApplication) {
        self.app = app
    }

    func isLoaded() -> Bool {
        return app.buttons["addButton"].exists
    }

    func addReminder(_ title: String) {
        guard isLoaded() else {
            fatalError("Reminder page is not loaded")
        }
        app.buttons["addButton"].tap()
        app.textFields["titleTextField"].tap()
        app.textFields["titleTextField"].typeText(title)
        app.navigationBars.firstMatch.buttons.firstMatch.tap()
    }
}

