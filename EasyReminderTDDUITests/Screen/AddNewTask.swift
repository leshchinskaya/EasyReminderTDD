//
//  AddNewTask.swift
//  EasyReminderTDDUITests
//
//  Created by pozhidaev on 07.06.2023.
//  Copyright © 2023 Mariya. All rights reserved.
//

import Foundation
import XCTest

enum AddNewTask {
    enum Element {
        /// Поле ввода названия задачи
        case title
        /// Поле ввода локации
        case location
        /// Поле ввода описания задачи
        case description
        /// Дата-пикер задачи
        case datepicker
        /// Кнопка назад  < для перехода на главный экран
        case back
        /// Поле ввода даты
        case date
        /// Кнопка открытия дата-пикера
        case myDate
        /// Кнопка выбора приоритета задачи
        case priority

    }

    static func get(_ element: Element) -> XCUIElement {
        switch element {
        case .title:
            return XCUIApplication().textFields[AccessibilityIDs.AddNewTask.title]
        case .location:
            return XCUIApplication().textFields[AccessibilityIDs.AddNewTask.location]
        case .description:
            return XCUIApplication().textViews[AccessibilityIDs.AddNewTask.description]
        case .datepicker:
            return XCUIApplication().datePickers[AccessibilityIDs.AddNewTask.datepicker]
        case .back:
            return XCUIApplication().buttons[AccessibilityIDs.AddNewTask.back]
        case .date:
            return XCUIApplication().textFields[AccessibilityIDs.AddNewTask.date]
        case .myDate:
            return XCUIApplication().datePickers[AccessibilityIDs.AddNewTask.myDate]
        case .priority:
            return XCUIApplication().segmentedControls[AccessibilityIDs.AddNewTask.priority]
        
        }
    }
}

