//
//  FluentInterface.swift
//  EasyReminderTDDUITests
//
//  Created by Maria Leshchinskaya on 16.10.2024.
//  Copyright © 2024 Mariya. All rights reserved.
//

import XCTest

class ReminderPageFluent {
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

    @discardableResult
    func tapAddReminder() -> ReminderPageFluent {
        addReminderButton.tap()
        return self
    }

    @discardableResult
    func enterReminderTitle(_ title: String) -> ReminderPageFluent {
        reminderTitleField.tap()
        reminderTitleField.typeText(title)
        return self
    }

    @discardableResult
    func tapBackButton() -> ReminderPageFluent {
        backButton.tap()
        return self
    }
}
