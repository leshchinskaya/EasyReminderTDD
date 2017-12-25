//
//  UpdateReminderViewControllerTests.swift
//  EasyReminderTDDTests
//
//  Created by Marie on 24.12.17.
//  Copyright © 2017 Mariya. All rights reserved.
//

import XCTest
@testable import EasyReminderTDD

class UpdateReminderViewControllerTests: XCTestCase {
    
    var updateReminderVC : UpdateReminderViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        updateReminderVC = storyboard.instantiateViewController(withIdentifier: "UpdateReminderViewController") as! UpdateReminderViewController
        UIApplication.shared.keyWindow!.rootViewController = updateReminderVC
        
        let _ = updateReminderVC.view
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
