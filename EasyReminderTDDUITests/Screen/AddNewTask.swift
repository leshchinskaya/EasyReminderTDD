//
//  AddNewTask.swift
//  EasyReminderTDDUITests
//
//  Created by pozhidaev on 07.06.2023.
//  Copyright © 2023 Mariya. All rights reserved.
//

import Foundation
import XCTest

enum AddNewTaskScreen {
    enum Element {
        /// Поле ввода названия задачи
        case title
        /// Поле ввода локации
        case location
        /// Поле ввода описания задачи
        case description
        /// Кнопка назад  < для перехода на главный экран
        case back
        /// Поле ввода даты
        case date
        /// Кнопка открытия дата-пикера
        case myDate
        /// Кнопка выбора приоритета задачи
        case priority
        /// Выбор даты в календаре
        case choiseDate
        /// Чек-бокс созданной задачи
        case passTask
    }

    static func get(_ element: Element) -> XCUIElement {
        switch element {
        case .title:
            return XCUIApplication().textFields[AccessibilityIDs.AddNewTask.title]
        case .location:
            return XCUIApplication().textFields[AccessibilityIDs.AddNewTask.location]
        case .description:
            return XCUIApplication().textViews[AccessibilityIDs.AddNewTask.description]
        case .back:
            return XCUIApplication().navigationBars["EasyReminderTDD.NewReminderView"].buttons["Easy Reminder"]
        case .date:
            return XCUIApplication().textFields[AccessibilityIDs.AddNewTask.date]
        case .myDate:
            return XCUIApplication().datePickers[AccessibilityIDs.AddNewTask.myDate]
        case .priority:
            return XCUIApplication().segmentedControls[AccessibilityIDs.AddNewTask.priority]
        case .choiseDate:
            return XCUIApplication().datePickers.collectionViews.buttons[Constants.Date.tomorrowDate].otherElements.containing(.staticText, identifier:Constants.Date.tomorrowDateId).element
        case .passTask:
            return XCUIApplication().tables.cells.containing(.staticText, identifier:"Тест").otherElements["CheckId"]
        }
    }
}

