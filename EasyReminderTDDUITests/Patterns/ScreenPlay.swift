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
    private let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    func attemptsTo(_ task: Task) {
        task.performAs(actor: self)
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

class AddReminder: Task {
    private let title: String

    init(title: String) {
        self.title = title
    }

    func performAs(actor: Actor) {
        actor.addReminderButton.tap()
        actor.reminderTitleField.tap()
        actor.reminderTitleField.typeText(title)
        actor.backButton.tap()
    }
}
