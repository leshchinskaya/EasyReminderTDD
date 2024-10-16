//
//  MBT.swift
//  EasyReminderTDDUITests
//
//  Created by Maria Leshchinskaya on 16.10.2024.
//  Copyright © 2024 Mariya. All rights reserved.
//

import XCTest

class ReminderModel {
    enum State {
        case noReminder, creatingReminder, reminderSaved
    }
    
    var currentState: State = .noReminder
    private let app: XCUIApplication

    init(app: XCUIApplication) {
        self.app = app
    }

    func addReminder() {
        guard currentState == .noReminder else { return }
        let addReminderButton = app.buttons["addButton"]
        addReminderButton.tap()

        currentState = .creatingReminder
    }

    func enterReminderTitle(_ title: String) {
        guard currentState == .creatingReminder else { return }
        let reminderTitleField = app.textFields["titleTextField"]
        reminderTitleField.tap()
        reminderTitleField.typeText(title)
    }

    func saveReminder() {
        guard currentState == .creatingReminder else { return }
        let backButton = app.navigationBars.firstMatch.buttons.firstMatch
        backButton.tap()

        currentState = .reminderSaved
    }
}

