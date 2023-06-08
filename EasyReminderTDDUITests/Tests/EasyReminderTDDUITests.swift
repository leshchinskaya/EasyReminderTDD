//
//  EasyReminderTDDUITests.swift
//  EasyReminderTDDUITests
//
//  Created by leshchinskaya on 08.06.2023.
//  Copyright © 2023 Mariya. All rights reserved.
//

import XCTest

final class EasyReminderTDDUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    func test1() {
        app.launch()
        // Я вижу таблицу с напоминаниями
        XCTAssertTrue(ERTableScreen.get(.tableView).waitForExistence(timeout: 5))
        XCTAssertFalse(XCUIApplication().staticTexts[Constants.Texts.title].exists)
        // Я нажимаю кнопку Add в NavigationBar
        // ERTableScreen.get(.addButton).tap()
        ERTableScreen.tap(.addButton)
        // Я проверяю, что нахожусь на экране Добавления уведомления
        XCTAssertTrue(NewReminderScreen.get(.descripTextView).waitForExistence(timeout: 5))
        XCTAssertTrue(NewReminderScreen.get(.descripTextView).exists)
        XCTAssertTrue(NewReminderScreen.get(.titleTextField).exists)
        // Я заполняю Description
        NewReminderScreen.get(.descripTextView).tap()
        NewReminderScreen.get(.descripTextView).typeText(Constants.Texts.description)
        // Я заполняю Title
        NewReminderScreen.get(.titleTextField).tap()
        NewReminderScreen.get(.titleTextField).typeText(Constants.Texts.title)
        // Я возвращаюсь назад
        CommonScreen.get(.backButton).tap()
        // Я вижу добавленное уведомление в таблице уведомлений
        XCTAssertTrue(ERTableScreen.get(.tableView).waitForExistence(timeout: 5))
        XCTAssertTrue(XCUIApplication().staticTexts[Constants.Texts.title].exists)
    }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
        
        XCUIApplication().navigationBars["Easy Reminder"].buttons["Add"].tap()
        
    }
}
