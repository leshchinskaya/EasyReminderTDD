//
//  CommonScreen.swift
//  EasyReminderTDDUITests
//
//  Created by leshchinskaya on 08.06.2023.
//  Copyright © 2023 Mariya. All rights reserved.
//

import XCTest

enum CommonScreen {
    enum Element {
        case backButton
    }

    static func get(_ element: Element) -> XCUIElement {
        switch element {
        case .backButton:
            return XCUIApplication().navigationBars.firstMatch.buttons.firstMatch
        }
    }
}
