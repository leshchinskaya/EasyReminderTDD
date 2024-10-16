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
