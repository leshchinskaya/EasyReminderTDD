//
//  ERTableScreen.swift
//  EasyReminderTDDUITests
//
//  Created by leshchinskaya on 08.06.2023.
//  Copyright © 2023 Mariya. All rights reserved.
//

import XCTest

enum ERTableScreen {
    enum Element {
        /// Кнопка Add в NavigaionBar
        case addButton
        /// Кнопка Filter в NavigaionBar
        case filterButton
        /// Таблица напоминаний
        case tableView
    }

    static func get(_ element: Element) -> XCUIElement {
        switch element {
        case .addButton:
            return XCUIApplication().buttons["addButton"]
        case .filterButton:
            return XCUIApplication().buttons["filterButton"]
        case .tableView:
            return XCUIApplication().tables["tableView"]
        }
    }
    
    static func tap(_ element: Element) {
        get(element).tap()
    }
}
