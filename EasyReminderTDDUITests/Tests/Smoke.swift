//
//  Smoke.swift
//  EasyReminderTDDUITests
//
//  Created by pozhidaev on 07.06.2023.
//  Copyright © 2023 Mariya. All rights reserved.
//

import Foundation
import XCTest

let app = XCUIApplication()

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
        MainScreen.get(.addButton).tap()
        XCTAssertTrue(AddNewTaskScreen.get(.title).exists)
        /// В поле “Description” ввести описание задачи -> Поле заполнено
        AddNewTaskScreen.get(.description).tap()
        AddNewTaskScreen.get(.description).typeText("Тестовый тест тестируем")
        XCTAssertEqual(AddNewTaskScreen.get(.description).value as! String, "Тестовый тест тестируем")
        /// В поле “Title” ввести название задачи -> Поле заполнено
        AddNewTaskScreen.get(.title).tap()
        AddNewTaskScreen.get(.title).typeText("Тест")
        XCTAssertEqual(AddNewTaskScreen.get(.title).value as! String, "Тест")
        /// Тап по дата-пикеру -> Появляется календарь
        AddNewTaskScreen.get(.myDate).tap()
        /// Тап по нужной дате -> Тап по свободному пространству вне календаря -> Календарь закрывается -> Поле ввода даты заполнено
        AddNewTaskScreen.get(.choiseDate).tap()
        app.coordinate(withNormalizedOffset: CGVector(dx: 0.1, dy: 0.1)).tap()
        XCTAssertEqual(AddNewTaskScreen.get(.date).value as! String, "06-10-2023")
        /// В поле “Location” ввести название локации -> Поле заполнено
        AddNewTaskScreen.get(.location).tap()
        AddNewTaskScreen.get(.location).typeText("Воронеж")
        XCTAssertEqual(AddNewTaskScreen.get(.location).value as! String, "Воронеж")
        /// Тап по приоритету в Свитчере -> Кнопка приоритета выделена
        AddNewTaskScreen.get(.priority).buttons.element(boundBy: 2).tap()
        XCTAssertTrue(AddNewTaskScreen.get(.priority).buttons.element(boundBy: 2).isSelected)
        /// Тап по кнопке назад -> Переход на Главный экран -> Задача сохранена
        AddNewTaskScreen.get(.back).tap()
        /// Тап по чек-боксу -> Задача переходит в список выполненных
        AddNewTaskScreen.get(.passTask).tap()
        XCTAssertFalse(AddNewTaskScreen.get(.passTask).isSelected)
    }
}
