//
//  Command.swift
//  EasyReminderTDDUITests
//
//  Created by Maria Leshchinskaya on 21.10.2024.
//  Copyright © 2024 Mariya. All rights reserved.
//

import XCTest

protocol Command {
    func execute()
}

class AddReminderCommand: Command {
    private let app: XCUIApplication
    private let title: String

    init(app: XCUIApplication, title: String) {
        self.app = app
        self.title = title
    }

    func execute() {
        let addButton = app.buttons["addButton"]
        addButton.tap()

        let titleField = app.textFields["titleTextField"]
        titleField.tap()
        titleField.typeText(title)

        let backButton = app.navigationBars.firstMatch.buttons.firstMatch
        backButton.tap()
    }
}


