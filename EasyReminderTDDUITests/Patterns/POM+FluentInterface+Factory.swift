//
//  POM+FluentInterface+Factory.swift
//  EasyReminderTDDUITests
//
//  Created by Maria Leshchinskaya on 21.10.2024.
//  Copyright © 2024 Mariya. All rights reserved.
//

import XCTest

// Page Object для ReminderPage
class Reminder3Page {
    private let app: XCUIApplication

    init(app: XCUIApplication) {
        self.app = app
    }

    var addButton: XCUIElement {
        return app.buttons["addButton"]
    }

    var titleField: XCUIElement {
        return app.textFields["titleTextField"]
    }

    var backButton: XCUIElement {
        return app.navigationBars.firstMatch.buttons.firstMatch
    }

    @discardableResult
    func tapAddButton() -> Reminder3Page {
        addButton.tap()
        return self
    }

    @discardableResult
    func enterTitle(_ title: String) -> Reminder3Page {
        titleField.tap()
        titleField.typeText(title)
        return self
    }

    @discardableResult
    func tapSaveButton() -> Reminder3Page {
        backButton.tap()
        return self
    }
}

// Factory для создания страниц
class Page3Factory {
    static func createReminderPage(app: XCUIApplication) -> Reminder3Page {
        return Reminder3Page(app: app)
    }
}

