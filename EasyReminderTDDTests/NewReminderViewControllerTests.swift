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
    
    func test_SaveButtonHasSaveAction() {
        let saveButton: UIButton = newReminderVC.saveButton
        guard let actions = saveButton.actions(forTarget: newReminderVC, forControlEvent: .touchUpInside)
            else {
                XCTFail();
                return }
        XCTAssertTrue(actions.contains("save"))
    }
    
}
