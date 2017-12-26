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
    
    func test_SaveButtonHasSaveAction() {
        let saveButton: UIButton = updateReminderVC.saveButton
        guard let actions = saveButton.actions(forTarget: updateReminderVC, forControlEvent: .touchUpInside)
            else {
                XCTFail();
                return }
        XCTAssertTrue(actions.contains("save"))
    }
    
}
