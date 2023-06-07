//
//  Smoke.swift
//  EasyReminderTDDUITests
//
//  Created by pozhidaev on 07.06.2023.
//  Copyright © 2023 Mariya. All rights reserved.
//

import Foundation
import XCTest

class SmokeTest: XCTestCase {
    
    override func setUp() {
            super.setUp()
            continueAfterFailure = false
            XCUIApplication().launch()
        }

        override func tearDown() {
            super.tearDown()
        }

        func testAppLaunch() {
            XCTAssertTrue(XCUIApplication().isHittable)
        }
    
    func testSmoke() throws {
        
        /// Тап по кнопке “Add” -> Переход на экран создания задачи
        let stepToNewAddTask = XCUIApplication().buttons[AccessibilityIDs.Main.addButton]
        stepToNewAddTask.tap()
        XCTAssertTrue(XCUIApplication().textFields[AccessibilityIDs.AddNewTask.title].exists)
        
        /// В поле “Title” ввести название задачи -> Поле заполнено
        let titleField = XCUIApplication().textFields[AccessibilityIDs.AddNewTask.title]
        titleField.tap()
        titleField.typeText("Тест")
        XCTAssertEqual(titleField.value as! String, "Тест")
        
        // Тап по дата-пикеру -> Появляется календарь
        
        // Тап по нужной дате -> Тап по свободному пространству вне календаря -> Календарь закрывается -> Поле ввода даты заполнено
        let choiseDate = XCUIApplication().datePickers[AccessibilityIDs.AddNewTask.datepicker].collectionViews.buttons["Thursday, June 8"].otherElements.containing(.staticText, identifier:"8").element
        choiseDate.tap()
        XCTAssertEqual(XCUIApplication().textFields[AccessibilityIDs.AddNewTask.date].value as! String, "06-08-2023")
        
        // В поле “Location” ввести название локации -> Поле заполнено
        let locationField = XCUIApplication().textFields[AccessibilityIDs.AddNewTask.location]
        locationField.tap()
        locationField.typeText("Воронеж")
        XCTAssertEqual(locationField.value as! String, "Воронеж")
        
        // Тап по приоритету в Свитчере -> Кнопка приоритета выделена
        let choisePriority = XCUIApplication().buttons[AccessibilityIDs.AddNewTask.segmented_control_high_priority]
        choisePriority.tap()
        XCTAssertTrue(choisePriority.isSelected)
        
        // В поле “Description” ввести описание задачи -> Поле заполнено
        let descriptionField = XCUIApplication().textFields[AccessibilityIDs.AddNewTask.description]
        descriptionField.tap()
        descriptionField.typeText("Тестовый тест тестируем")
        XCTAssertEqual(descriptionField.value as! String, "Тестовый тест тестируем")
        
        // Тап по кнопке назад -> Переход на Главный экран -> Задача сохранена
        let saveTask = XCUIApplication().buttons[AccessibilityIDs.AddNewTask.back].tap()
        XCTAssertEqual(XCUIApplication().staticTexts[AccessibilityIDs.Main.datelabel].value as! String, "06-08-2023")
        
        // Тап по чек-боксу -> Задача переходит в список выполненных
        let passTask = XCUIApplication().checkBoxes[AccessibilityIDs.Main.checkBox].tables.cells.containing(.staticText, identifier:"Тест").otherElements["CheckId"]
        passTask.tap()
        XCTAssertFalse(passTask.isSelected, "Задача не переходит в список выполненных")
    }
}
