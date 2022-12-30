//
//  EasyReminderTDDUITests1.swift
//  EasyReminderTDDUITests1
//
//  Created by Егор Зайцев on 27.12.2022.
//  Copyright © 2022 Mariya. All rights reserved.
//

import XCTest

final class EasyReminderTDDUITests1: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
      
        //app.tables.cells.firstMatch.staticTexts["titleFirst"].tap()
        XCTAssertEqual(app.tables.cells.firstMatch.staticTexts["titleFirst"].label, "title one")
        app.tables.cells.firstMatch.staticTexts["titleFirst"].tap()
        app.textFields["textfield"].tap()
        app.textFields["textfield"].clearText()
        app.textFields["textfield"].typeText("title two")
        app.navigationBars.children(matching: .button).firstMatch.tap()
        XCTAssertNotEqual(app.tables.cells.firstMatch.staticTexts["titleFirst"].label, "title two")
        //XCTAssertEqual(app.tables)
        //app.buttons["save"].tap()
        //app.tables/*@START_MENU_TOKEN@*/.staticTexts["title one"]/*[[".cells.staticTexts[\"title one\"]",".staticTexts[\"title one\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        // app.buttons.containing(NSPredicate(format: "label == %@", "Filter")).element.tap()
        //app.buttons["Add"].press(forDuration: 0.9)
        //app.navigationBars.children(matching: .button).firstMatch.tap()
        // app.alerts.buttons.firstMatch.tap()
        // app.tables.cells.firstMatch.coordinate(withNormalizedOffset: CGVector(dx: 0.7, dy: 0.1)).press(forDuration: 0.9)
        sleep(5)
        // XCUIApplication().navigationBars["Easy Reminder"]/*@START_MENU_TOKEN@*/.buttons["filter"]/*[[".buttons[\"Filter\"]",".buttons[\"filter\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
       // XCTAssertEqual(app.tables.cells.firstMatch.label, "title one")
        // app.buttons["filter"].press(forDuration: 9.9)
        // XCTAssertTrue(XCUIApplication().buttons["filter"].isSelected)
       // XCTAssertTrue(app.buttons["Easy Reminder"].exists)
        //coordinate(withNormalizedOffset: CGVector(dx: 0.4, dy: 0.0)).tap()
        // XCUIApplication().tables.cells.containing(.staticText, identifier:"title one").element.tap()
        
     
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func test1() throws {
           let app = XCUIApplication()
           app.launch()
           sleep(5)
        
       }
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
