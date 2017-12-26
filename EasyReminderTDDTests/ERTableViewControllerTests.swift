//
//  ERTableViewControllerTests.swift
//  EasyReminderTDDTests
//
//  Created by Marie on 23.12.17.
//  Copyright © 2017 Mariya. All rights reserved.
//

import XCTest
@testable import EasyReminderTDD

class ERTableViewControllerTests: XCTestCase {
    
    var erTableVC : ERTableViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        erTableVC = storyboard.instantiateViewController(withIdentifier: "ERTableViewController") as! ERTableViewController
        UIApplication.shared.keyWindow!.rootViewController = erTableVC
        
        let _ = erTableVC.view
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func test_DeleteReminder() {
        
    }
    
}
