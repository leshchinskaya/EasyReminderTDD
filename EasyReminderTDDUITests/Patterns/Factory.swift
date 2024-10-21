//
//  Factory.swift
//  EasyReminderTDDUITests
//
//  Created by Maria Leshchinskaya on 21.10.2024.
//  Copyright © 2024 Mariya. All rights reserved.
//

import XCTest

class PageFactory {
    static func createReminderPage(app: XCUIApplication) -> ReminderFactoryPage {
        return ReminderFactoryPage(app: app)
    }
}

class ReminderFactoryPage {
    private let app: XCUIApplication

    init(app: XCUIApplication) {
        self.app = app
    }

    func addReminder(_ title: String) {
        app.buttons["addButton"].tap()
        app.textFields["titleTextField"].tap()
        app.textFields["titleTextField"].typeText(title)
        app.navigationBars.firstMatch.buttons.firstMatch.tap()
    }
}

