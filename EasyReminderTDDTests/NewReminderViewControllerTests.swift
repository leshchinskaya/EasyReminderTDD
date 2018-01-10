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
    
    let dateFormatter = DateFormatter()
    
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
    
    func test_HasAllElementsOnView() {
        XCTAssertNotNil(newReminderVC.titleTextField)
        XCTAssertNotNil(newReminderVC.locationTextField)
        XCTAssertNotNil(newReminderVC.segmentedControl)
        XCTAssertNotNil(newReminderVC.descripTextView)
        XCTAssertNotNil(newReminderVC.dateTextField)
    }
    
    func test_NewReminder(){
        //dateFormatter.dateFormat = "MM-dd-yyyy"
        
        newReminderVC.titleTextField.text = "Title New"
        newReminderVC.dateTextField.text = "12-10-2017"
        newReminderVC.locationTextField.text = "Voronezh"
        newReminderVC.descripTextView.text = "Description New"
        newReminderVC.newIndexPrec = 1

        newReminderVC.save()
        
        let newScore = newReminderVC.f
        XCTAssertEqual(newScore, true)
        
    }
    
    func test_NewReminderWithNilTitle(){
        //dateFormatter.dateFormat = "MM-dd-yyyy"
        
        newReminderVC.titleTextField.text = nil
        newReminderVC.dateTextField.text = "12-10-2017"
        newReminderVC.locationTextField.text = "Voronezh"
        newReminderVC.descripTextView.text = "Description New"
        newReminderVC.newIndexPrec = 1

        newReminderVC.save()
        
        let newScore = newReminderVC.f
        XCTAssertEqual(newScore, false)
    }
    
    func test_ChangeIndexMoreThan3OrNo() {
        newReminderVC.segmentedControl.selectedSegmentIndex = 0
        newReminderVC.indexPrecedence(newReminderVC.segmentedControl)
        let newScore0 = newReminderVC.newIndexPrec
        
        newReminderVC.segmentedControl.selectedSegmentIndex = 5
        newReminderVC.indexPrecedence(newReminderVC.segmentedControl)
        let newScore5 = newReminderVC.newIndexPrec
        
        XCTAssertEqual(newScore0, 0)
        XCTAssertEqual(newScore5, 0)
    }
    
    func test_ChangeIndex() {
        
        newReminderVC.segmentedControl.selectedSegmentIndex = 1
        newReminderVC.indexPrecedence(newReminderVC.segmentedControl)
        let newScore1 = newReminderVC.newIndexPrec
        
        newReminderVC.segmentedControl.selectedSegmentIndex = 2
        newReminderVC.indexPrecedence(newReminderVC.segmentedControl)
        let newScore2 = newReminderVC.newIndexPrec
        
        newReminderVC.segmentedControl.selectedSegmentIndex = 3
        newReminderVC.indexPrecedence(newReminderVC.segmentedControl)
        let newScore3 = newReminderVC.newIndexPrec
        
        XCTAssertEqual(newScore1, 1)
        XCTAssertEqual(newScore2, 2)
        XCTAssertEqual(newScore3, 3)
    }
    
    func test_RemindersValueAfterAddNewReminder(){
        
        let valueBefore = newReminderVC.reminders.count
        
        newReminderVC.titleTextField.text = "Title New"
        newReminderVC.dateTextField.text = "12-10-2017"
        newReminderVC.locationTextField.text = "Voronezh"
        newReminderVC.descripTextView.text = "Description New"
        newReminderVC.newIndexPrec = 1
        
        newReminderVC.save()
        
        let valueAfter = newReminderVC.reminders.count
        let exp = valueAfter-valueBefore
        
        XCTAssertEqual(exp, 1)
        
    }
    
    func test_RemindersValueIfTitleNil(){
        
        let valueBefore = newReminderVC.reminders.count
        
        newReminderVC.titleTextField.text = ""
        newReminderVC.dateTextField.text = "12-10-2017"
        newReminderVC.locationTextField.text = "Voronezh"
        newReminderVC.descripTextView.text = "Description New"
        newReminderVC.newIndexPrec = 1
        
        newReminderVC.save()
        
        let valueAfter = newReminderVC.reminders.count
        let exp = valueAfter-valueBefore
        
        XCTAssertEqual(exp, 0)
        
    }
}
