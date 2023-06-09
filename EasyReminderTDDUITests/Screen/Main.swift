//
//  Main.swift
//  EasyReminderTDDUITests
//
//  Created by pozhidaev on 07.06.2023.
//  Copyright © 2023 Mariya. All rights reserved.
//

import Foundation
import XCTest

enum Main {
    enum Element {
        /// Кнопка Add для перехода на экран создания задачи
        case addButton
        /// Кнопка для перехода на экран с выполенными задачами
        case showClosedButton
        /// Чек-бокс закрытия задачи
        case checkBox
        /// Поле с датой задачи
        case datelabel
    }

    static func get(_ element: Element) -> XCUIElement {
        switch element {
        case .addButton:
            return XCUIApplication().buttons[AccessibilityIDs.Main.addButton]
        case .showClosedButton:
            return XCUIApplication().buttons[AccessibilityIDs.Main.showClosedButton]
        case .checkBox:
            return XCUIApplication().checkBoxes[AccessibilityIDs.Main.checkBox]
        case .datelabel:
            return XCUIApplication().staticTexts[AccessibilityIDs.Main.datelabel]
        }
    }
}
