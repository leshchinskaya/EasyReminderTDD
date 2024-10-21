//
//  ScreenPlay.swift
//  EasyReminderTDDUITests
//
//  Created by Maria Leshchinskaya on 16.10.2024.
//  Copyright © 2024 Mariya. All rights reserved.
//

import XCTest

protocol Task {
    func performAs(actor: Actor)
}

class Actor {
    let app: XCUIApplication

    init(app: XCUIApplication) {
        self.app = app
    }

    func attemptsTo(_ task: Task) {
        task.performAs(actor: self)
    }
}

class AddReminder: Task {
    private let title: String

    init(title: String) {
        self.title = title
    }

    func performAs(actor: Actor) {
        let reminderScreen = ReminderScreen(app: actor.app)
        reminderScreen.addReminderButton.tap()
        reminderScreen.reminderTitleField.tap()
        reminderScreen.reminderTitleField.typeText(title)
        reminderScreen.backButton.tap()
    }
}

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
