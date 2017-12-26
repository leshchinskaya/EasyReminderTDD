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
    
    let dateFormatter = DateFormatter()
    
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
    
    func test_NewReminder(){
        dateFormatter.dateFormat = "MM-dd-yyyy"
        
        updateReminderVC.newTitle = "Title New"
        updateReminderVC.newDate = dateFormatter.date(from: "12-10-2017")
        updateReminderVC.newLocation = "Voronezh"
        updateReminderVC.newDescrip = "Description New"
        updateReminderVC.newIndexPrec = 1
        
        updateReminderVC.save()
        
        let newScore = updateReminderVC.f
        XCTAssertEqual(newScore, true)
        
    }
    
    func test_NewReminderWithNilTitle(){
        dateFormatter.dateFormat = "MM-dd-yyyy"
        
        updateReminderVC.newTitle = nil
        updateReminderVC.newDate = dateFormatter.date(from: "12-10-2017")
        updateReminderVC.newLocation = "Voronezh"
        updateReminderVC.newDescrip = "Description New"
        updateReminderVC.newIndexPrec = 1
        
        updateReminderVC.save()
        
        let newScore = updateReminderVC.f
        XCTAssertEqual(newScore, false)
    }
    
}
