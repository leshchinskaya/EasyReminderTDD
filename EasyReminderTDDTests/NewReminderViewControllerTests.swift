//
//  NewReminderViewControllerTests.swift
//  EasyReminderTDDTests
//
//  Created by Marie on 24.12.17.
//  Copyright © 2017 Mariya. All rights reserved.
//

import XCTest
@testable import EasyReminderTDD

class NewReminderViewControllerTests: XCTestCase {
    
    var newReminderVC : NewReminderViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        newReminderVC = storyboard.instantiateViewController(withIdentifier: "NewReminderViewController") as! NewReminderViewController
        UIApplication.shared.keyWindow!.rootViewController = newReminderVC
        
        let _ = newReminderVC.view
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
