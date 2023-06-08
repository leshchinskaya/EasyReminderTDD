//
//  Constants.swift
//  EasyReminderTDDUITests
//
//  Created by pozhidaev on 08.06.2023.
//  Copyright © 2023 Mariya. All rights reserved.
//

import Foundation
import XCTest

// Выбор даты в календаре
let choiseDate = XCUIApplication()/*@START_MENU_TOKEN@*/.datePickers/*[[".otherElements[\"Preview\"].datePickers",".datePickers"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.collectionViews.buttons["Friday, June 9"].otherElements.containing(.staticText, identifier:"9").element

// Тап по свободной области
let freeSpace = app.coordinate(withNormalizedOffset: CGVector(dx: 0.1, dy: 0.1))

// Третья кнопка приоритета
let buttonIndex = 2

// Кнопка назад
let save = app.navigationBars["EasyReminderTDD.NewReminderView"].buttons["Easy Reminder"]

// Чек-бокс созданной задачи
let passTask = XCUIApplication().tables/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Тест")/*[[".cells.containing(.staticText, identifier:\"06-09-2023\")",".cells.containing(.staticText, identifier:\"Тест\")"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.otherElements["CheckId"]
