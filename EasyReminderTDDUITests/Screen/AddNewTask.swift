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
        // Кнопка выбора низкого приоритета задачи
        case segmented_control_low_priority
        /// Кнопка выбора среднего приоритета задачи
        case segmented_control_medium_priority
        /// Кнопка выбора высокого приоритета задачи
        case segmented_control_high_priority
        /// Поле ввода описания задачи
        case description
        // Дата-пикер задачи
        case datepicker
        /// Кнопка назад  < для перехода на главный экран
        case back
        /// Поле ввода даты
        case date

    }

    static func get(_ element: Element) -> XCUIElement {
        switch element {
        case .title:
            return XCUIApplication().textFields[AccessibilityIDs.AddNewTask.title]
        case .location:
            return XCUIApplication().textFields[AccessibilityIDs.AddNewTask.location]
        case .segmented_control_high_priority:
            return XCUIApplication().buttons[AccessibilityIDs.AddNewTask.segmented_control_high_priority]
        case .segmented_control_medium_priority:
            return XCUIApplication().buttons[AccessibilityIDs.AddNewTask.segmented_control_medium_priority]
        case .segmented_control_low_priority:
            return XCUIApplication().buttons[AccessibilityIDs.AddNewTask.segmented_control_low_priority]
        case .description:
            return XCUIApplication().textFields[AccessibilityIDs.AddNewTask.description]
        case .datepicker:
            return XCUIApplication().datePickers[AccessibilityIDs.AddNewTask.datepicker]
        case .back:
            return XCUIApplication().buttons[AccessibilityIDs.AddNewTask.back]
        case .date:
            return XCUIApplication().textFields[AccessibilityIDs.AddNewTask.date]
        }
    }
}

