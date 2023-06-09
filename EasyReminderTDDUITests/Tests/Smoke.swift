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
        Main.get(.addButton).tap()
        XCTAssertTrue(AddNewTask.get(.title).exists)
        /// В поле “Description” ввести описание задачи -> Поле заполнено
        AddNewTask.get(.description).tap()
        AddNewTask.get(.description).typeText("Тестовый тест тестируем")
        XCTAssertEqual(AddNewTask.get(.description).value as! String, "Тестовый тест тестируем")
        /// В поле “Title” ввести название задачи -> Поле заполнено
        AddNewTask.get(.title).tap()
        AddNewTask.get(.title).typeText("Тест")
        XCTAssertEqual(AddNewTask.get(.title).value as! String, "Тест")
        /// Тап по дата-пикеру -> Появляется календарь
        AddNewTask.get(.myDate).tap()
        /// Тап по нужной дате -> Тап по свободному пространству вне календаря -> Календарь закрывается -> Поле ввода даты заполнено
        AddNewTask.get(.choiseDate).tap()
        app.coordinate(withNormalizedOffset: CGVector(dx: 0.1, dy: 0.1)).tap()
        XCTAssertEqual(AddNewTask.get(.date).value as! String, "06-10-2023")
        /// В поле “Location” ввести название локации -> Поле заполнено
        AddNewTask.get(.location).tap()
        AddNewTask.get(.location).typeText("Воронеж")
        XCTAssertEqual(AddNewTask.get(.location).value as! String, "Воронеж")
        /// Тап по приоритету в Свитчере -> Кнопка приоритета выделена
        AddNewTask.get(.priority).buttons.element(boundBy: 2).tap()
        XCTAssertTrue(AddNewTask.get(.priority).buttons.element(boundBy: 2).isSelected)
        /// Тап по кнопке назад -> Переход на Главный экран -> Задача сохранена
        AddNewTask.get(.back).tap()
        /// Тап по чек-боксу -> Задача переходит в список выполненных
        AddNewTask.get(.passTask).tap()
        XCTAssertFalse(AddNewTask.get(.passTask).isSelected)
    }
}
