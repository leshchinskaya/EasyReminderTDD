//
//  ReminderScreenplayScreen.swift
//  EasyReminderTDDUITests
//
//  Created by Maria Leshchinskaya on 21.10.2024.
//  Copyright © 2024 Mariya. All rights reserved.
//

import XCTest

class ReminderScreen {
    private let app: XCUIApplication

    init(app: XCUIApplication) {
        self.app = app
    }

    var addReminderButton: XCUIElement {
        return app.buttons["addButton"]
    }

    var reminderTitleField: XCUIElement {
        return app.textFields["titleTextField"]
    }

    var backButton: XCUIElement {
        return app.navigationBars.firstMatch.buttons.firstMatch
    }
}
