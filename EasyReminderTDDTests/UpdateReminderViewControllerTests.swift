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
    
    func test_HasAllElementsOnView() {
        XCTAssertNotNil(updateReminderVC.titleTextField)
        XCTAssertNotNil(updateReminderVC.locationTextField)
        XCTAssertNotNil(updateReminderVC.segmentedControl)
        XCTAssertNotNil(updateReminderVC.descripTextView)
        XCTAssertNotNil(updateReminderVC.dateTextField)
    }

    func test_AlertExistWithNilTitle() {
        updateReminderVC.titleTextField.text = nil
        updateReminderVC.dateTextField.text = "12-10-2017"
        updateReminderVC.locationTextField.text = "Voronezh"
        updateReminderVC.descripTextView.text = "Description New"
        updateReminderVC.newIndexPrec = 1
        
        updateReminderVC.save()
        
        let newScore = updateReminderVC.titleTextField.text
        XCTAssertEqual(newScore, "Добавьте название")
    }

    func test_AlertExistWithNilDescription() {
        updateReminderVC.titleTextField.text = "Title"
        updateReminderVC.dateTextField.text = "12-10-2017"
        updateReminderVC.locationTextField.text = "Voronezh"
        updateReminderVC.newIndexPrec = 1
        
        updateReminderVC.save()
        
        let newScore = updateReminderVC.descripTextView.text
        XCTAssertEqual(newScore, "Добавьте описание")
    }
    
    /*
    func test_InitInformationSuccessWithNilValues() {
        
        updateReminderVC.reminderT.title = "Test"
        updateReminderVC.reminderT.descrip = "Des"
        dateFormatter.dateFormat = "MM-dd-yyyy"
        
        updateReminderVC.viewDidLoad()
        
        XCTAssertEqual(updateReminderVC.titleTextField.text, "Test")
        XCTAssertEqual(updateReminderVC.locationTextField.text, "")
        XCTAssertEqual(updateReminderVC.descripTextView.text, "Des")
        XCTAssertEqual(updateReminderVC.segmentedControl.selectedSegmentIndex, 0)
        XCTAssertEqual(updateReminderVC.dateTextField.text, "")
        
    }
     */
    
    func test_InitInformationSuccess() {
        
        updateReminderVC.reminderT.title = "Test"
        updateReminderVC.reminderT.location = "Voronezh"
        updateReminderVC.reminderT.descrip = "Des"
        dateFormatter.dateFormat = "MM-dd-yyyy"
        updateReminderVC.reminderT.date = dateFormatter.date(from: "10-10-2018") as! NSDate
        updateReminderVC.reminderT.precedence = 1
        
        updateReminderVC.viewDidLoad()
        
        XCTAssertEqual(updateReminderVC.titleTextField.text, "Test")
        XCTAssertEqual(updateReminderVC.locationTextField.text, "Voronezh")
        XCTAssertEqual(updateReminderVC.descripTextView.text, "Des")
        XCTAssertEqual(updateReminderVC.segmentedControl.selectedSegmentIndex, 1)
        XCTAssertEqual(updateReminderVC.dateTextField.text, "10-10-2018")
        //XCTAssertThrowsError(updateReminderVC.reminder?.date)
    }
    
    func test_NewReminder(){
        //dateFormatter.dateFormat = "MM-dd-yyyy"
        
        updateReminderVC.titleTextField.text = "Title New"
        updateReminderVC.dateTextField.text = "12-10-2017"
        updateReminderVC.locationTextField.text = "Voronezh"
        updateReminderVC.descripTextView.text = "Description New"
        updateReminderVC.newIndexPrec = 1
        
        updateReminderVC.save()
        
        let newScore = updateReminderVC.f
        XCTAssertEqual(newScore, true)
        
    }
    
    
    func test_NewReminderWithNilTitle(){
        //dateFormatter.dateFormat = "MM-dd-yyyy"
        
        updateReminderVC.titleTextField.text = nil
        updateReminderVC.dateTextField.text = "12-10-2017"
        updateReminderVC.locationTextField.text = "Voronezh"
        updateReminderVC.descripTextView.text = "Description New"
        updateReminderVC.newIndexPrec = 1
        
        updateReminderVC.save()
        
        let newScore = updateReminderVC.f
        XCTAssertEqual(newScore, false)
    }
    
    func test_NewReminderWithNilDesc(){
        //dateFormatter.dateFormat = "MM-dd-yyyy"
        
        updateReminderVC.titleTextField.text = "Title"
        updateReminderVC.dateTextField.text = "12-10-2017"
        updateReminderVC.locationTextField.text = "Voronezh"
        updateReminderVC.newIndexPrec = 1
        
        updateReminderVC.save()
        
        let newScore = updateReminderVC.f
        XCTAssertEqual(newScore, false)
    }
    
    func test_ChangeIndexMoreThan3OrNo() {
        updateReminderVC.segmentedControl.selectedSegmentIndex = 0
        updateReminderVC.changeIndex(updateReminderVC.segmentedControl)
        let newScore0 = updateReminderVC.newIndexPrec
        
        updateReminderVC.segmentedControl.selectedSegmentIndex = 5
        updateReminderVC.changeIndex(updateReminderVC.segmentedControl)
        let newScore5 = updateReminderVC.newIndexPrec
        
        XCTAssertEqual(newScore0, 0)
        XCTAssertEqual(newScore5, 0)
    }
    
    func test_ChangeIndex() {
        
        updateReminderVC.segmentedControl.selectedSegmentIndex = 1
        updateReminderVC.changeIndex(updateReminderVC.segmentedControl)
        let newScore1 = updateReminderVC.newIndexPrec
        
        updateReminderVC.segmentedControl.selectedSegmentIndex = 2
        updateReminderVC.changeIndex(updateReminderVC.segmentedControl)
        let newScore2 = updateReminderVC.newIndexPrec
        
        updateReminderVC.segmentedControl.selectedSegmentIndex = 3
        updateReminderVC.changeIndex(updateReminderVC.segmentedControl)
        let newScore3 = updateReminderVC.newIndexPrec
        
        XCTAssertEqual(newScore1, 1)
        XCTAssertEqual(newScore2, 2)
        XCTAssertEqual(newScore3, 3)
    }
    
    func test_RemindersValueAfterAddNewReminder(){
        
        let valueBefore = updateReminderVC.reminders.count
       
        updateReminderVC.titleTextField.text = "Title New New"
        updateReminderVC.dateTextField.text = "12-10-2017"
        updateReminderVC.locationTextField.text = "Voronezh"
        updateReminderVC.descripTextView.text = "Description New New"
        updateReminderVC.newIndexPrec = 1
        
        updateReminderVC.save()
    
        let valueAfter = updateReminderVC.reminders.count
        let exp = valueAfter-valueBefore
        
        XCTAssertEqual(exp, 0)
        
    }
    
    func test_RemindersValueIfTitleNil(){
        
        let valueBefore = updateReminderVC.reminders.count
        
        updateReminderVC.titleTextField.text = ""
        updateReminderVC.dateTextField.text = "12-10-2017"
        updateReminderVC.locationTextField.text = "Voronezh"
        updateReminderVC.descripTextView.text = "Description New New"
        updateReminderVC.newIndexPrec = 1
        
        updateReminderVC.save()
        
        
        let valueAfter = updateReminderVC.reminders.count
        let exp = valueAfter-valueBefore
        
        XCTAssertEqual(exp, 0)
        
    }
    
    func test_UpdateSuccess() {
        
        updateReminderVC.reminder?.title = "Test"
        updateReminderVC.reminder?.descrip = "Test"
        updateReminderVC.reminder?.location = "Voronezh"
        dateFormatter.dateFormat = "MM-dd-yyyy"
        updateReminderVC.reminder?.date = dateFormatter.date(from: "10-10-2018") as! NSDate
        updateReminderVC.reminder?.precedence = 0

        
        updateReminderVC.titleTextField.text = "Title New"
        updateReminderVC.locationTextField.text = "Voronezh"
        updateReminderVC.dateTextField.text = "10-10-2017"
        updateReminderVC.descripTextView.text = "Description New"
        updateReminderVC.newIndexPrec = 1
        
        updateReminderVC.save()
        
        XCTAssertEqual(updateReminderVC.reminder?.title, "Title New")
        XCTAssertEqual(updateReminderVC.reminder?.location, "Voronezh")
        XCTAssertEqual(updateReminderVC.reminder?.descrip, "Description New")
        XCTAssertEqual(updateReminderVC.reminder?.precedence, 1)
        XCTAssertEqual(updateReminderVC.reminder?.date, dateFormatter.date(from: "10-10-2017") as! NSDate)
    }
    
    func test_UpdateSuccessWithNilValues() {
        
        updateReminderVC.reminder?.title = "Test"
        updateReminderVC.reminder?.descrip = "Test"
        updateReminderVC.reminder?.location = "Voronezh"
        dateFormatter.dateFormat = "MM-dd-yyyy"
        updateReminderVC.reminder?.date = dateFormatter.date(from: "10-10-2018") as! NSDate
        updateReminderVC.reminder?.precedence = 0
        
        
        updateReminderVC.titleTextField.text = "Title New"
        updateReminderVC.descripTextView.text = "Description New"
        
        updateReminderVC.save()
        
        XCTAssertEqual(updateReminderVC.reminder?.title, "Title New")
        XCTAssertEqual(updateReminderVC.reminder?.location, "")
        XCTAssertEqual(updateReminderVC.reminder?.descrip, "Description New")
        XCTAssertEqual(updateReminderVC.reminder?.precedence, 0)
        XCTAssertEqual(updateReminderVC.reminder?.date, nil)
    }
    
    func test_DateAbrakadabraSuccess() {
        dateFormatter.dateFormat = "MM-dd-yyyy"
        updateReminderVC.titleTextField.text = "Title"
        updateReminderVC.dateTextField.text = "jhkhlk"
        updateReminderVC.locationTextField.text = "Voronezh"
        updateReminderVC.descripTextView.text = "Description New"
        updateReminderVC.newIndexPrec = 1
        
        updateReminderVC.save()
        
        XCTAssertEqual(updateReminderVC.newDate, nil)
        
    }
    
    func test_DateNilSuccess() {
        dateFormatter.dateFormat = "MM-dd-yyyy"
        updateReminderVC.titleTextField.text = "Title"
        updateReminderVC.locationTextField.text = "Voronezh"
        updateReminderVC.descripTextView.text = "Description New"
        updateReminderVC.newIndexPrec = 1
        
        updateReminderVC.save()
        
        XCTAssertEqual(updateReminderVC.newDate, nil)
        
    }
    
    func test_LocationNilSuccess() {
        dateFormatter.dateFormat = "MM-dd-yyyy"
        updateReminderVC.titleTextField.text = "Title"
        updateReminderVC.dateTextField.text = "10-10-2017"
        updateReminderVC.descripTextView.text = "Description New"
        updateReminderVC.newIndexPrec = 1
        
        updateReminderVC.save()
        
        XCTAssertEqual(updateReminderVC.newLocation, "")
    }
    
    func test_PrecNilSuccess() {
        dateFormatter.dateFormat = "MM-dd-yyyy"
        updateReminderVC.titleTextField.text = "Title"
        updateReminderVC.dateTextField.text = "10-10-2017"
        updateReminderVC.locationTextField.text = "Voronezh"
        updateReminderVC.descripTextView.text = "Description New"
        
        updateReminderVC.save()
        
        XCTAssertEqual(updateReminderVC.newIndexPrec, 0)
    }

    func test_SaveButtonHasSaveAction() {
        let saveButton: UIButton = updateReminderVC.saveButton
        guard let actions = saveButton.actions(forTarget: updateReminderVC, forControlEvent: .touchUpInside)
            else {
                XCTFail();
                return }
        XCTAssertTrue(actions.contains("save"))
    }
    
}
