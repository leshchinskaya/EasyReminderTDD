//
//  PatternsExample.swift
//  EasyReminderTDDUITests
//
//  Created by Maria Leshchinskaya on 16.10.2024.
//  Copyright © 2024 Mariya. All rights reserved.
//

import XCTest

final class PatternsExample: XCTestCase {
    
    let app = XCUIApplication()
    
    func testPOM() throws {
        app.launch()
        let reminderPage = ReminderPage(app: app)
        reminderPage.tapAddReminder()
        reminderPage.enterReminderTitle("Buy coffee")
        reminderPage.tapBackButton()
    }
    
    func testScreenPlay() throws {
        app.launch()
        let actor = Actor(app: app)
        actor.attemptsTo(AddReminder(title: "Buy coffee"))
    }
    
    func testFluentInterface() throws {
        app.launch()
        ReminderPageFluent(app: app)
            .tapAddReminder()
            .enterReminderTitle("Buy coffee")
            .tapBackButton()
    }
    
    func testMBT() throws {
        app.launch()
        let reminderModel = ReminderModel(app: app)
        reminderModel.addReminder()
        reminderModel.enterReminderTitle("Buy coffee")
        reminderModel.saveReminder()
        XCTAssertEqual(reminderModel.currentState, .reminderSaved)
    }
    
    func testDI() throws {
        app.launch()
        let reminderPage = ReminderPageDI(app: app)
        reminderPage.tapAddReminder()
        reminderPage.enterReminderTitle("Buy coffee")
        reminderPage.tapBackButton()
    }
}


class ContactPageFluent {
    private let app: XCUIApplication

    init(app: XCUIApplication) {
        self.app = app
    }

    var addButton: XCUIElement {
        return app.buttons["addButton"]
    }

    var nameField: XCUIElement {
        return app.textFields["nameField"]
    }

    var saveButton: XCUIElement {
        return app.buttons["saveButton"]
    }

    var backButton: XCUIElement {
        return app.navigationBars.buttons["Back"]
    }

    @discardableResult
    func tapAddButton() -> ContactPageFluent {
        addButton.tap()
        return self
    }

    @discardableResult
    func enterName(_ name: String) -> ContactPageFluent {
        nameField.tap()
        nameField.typeText(name)
        return self
    }

    @discardableResult
    func tapSaveButton() -> ContactPageFluent {
        saveButton.tap()
        return self
    }

    @discardableResult
    func tapBackButton() -> ContactPageFluent {
        backButton.tap()
        return self
    }
}

func testAddingContactWithFluentInterface() {
    let app = XCUIApplication()
    app.launch()

    ContactPageFluent(app: app)
        .tapAddButton()
        .enterName("Alice")
        .tapSaveButton()
        .tapBackButton()
}


