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
    
    func test_TableViewExists() {
        XCTAssertNotNil(erTableVC.tableView)
    }
    
    func test_Reload() {
        let indexPath = IndexPath(row: 1, section: 0)
        erTableVC.deletedReminders[indexPath.row] = 0
        erTableVC.tableView(erTableVC.tableView, commit: .delete, forRowAt: indexPath)
        //erTableVC.tableView.deleteRows(at: [indexPath], with: .fade)
    }

    func test_DeleteReminderSuccess() {
        var indexPath = IndexPath(row: 1, section: 0)
        erTableVC.deletedReminders[indexPath.row] = 1
        erTableVC.tableView(erTableVC.tableView, commit: .delete, forRowAt: indexPath)
        let newScore1 = erTableVC.deleteFlag
        XCTAssertEqual(newScore1, true)
        
        indexPath = IndexPath(row: 0, section: 0)
        erTableVC.deletedReminders[indexPath.row] = 0
        erTableVC.tableView(erTableVC.tableView, commit: .delete, forRowAt: indexPath)
        let newScore2 = erTableVC.deleteFlag
        XCTAssertEqual(newScore2, true)
        
    }

    func test_DeleteReminderFailed() {
        var indexPath = IndexPath(row: -1, section: 0)
        erTableVC.tableView(erTableVC.tableView, commit: .delete, forRowAt: indexPath)
        let newScore1 = erTableVC.deleteFlag
        
        XCTAssertEqual(newScore1, false)
        
        indexPath = IndexPath(row: 3, section: 0)
        erTableVC.tableView(erTableVC.tableView, commit: .delete, forRowAt: indexPath)
        let newScore2 = erTableVC.deleteFlag
        XCTAssertEqual(newScore2, false)
        
        /*
        indexPath = IndexPath(row: 1, section: 0)
        erTableVC.deletedReminders[indexPath.row] = 0
        erTableVC.tableView(erTableVC.tableView, commit: .delete, forRowAt: indexPath)
        let newScore3 = erTableVC.deleteFlag
        XCTAssertEqual(newScore3, false)
 */
    }
    
    func test_SortedOrClosedFlagTrue() {
        erTableVC.sortedFlag = true
        erTableVC.closedFlag = false
        var indexPath = IndexPath(row: 0, section: 0)
        erTableVC.tableView(erTableVC.tableView, commit: .delete, forRowAt: indexPath)
        let newScore1 = erTableVC.deleteFlag
        XCTAssertEqual(newScore1, false)
        
        erTableVC.sortedFlag = false
        erTableVC.closedFlag = true
        erTableVC.tableView(erTableVC.tableView, commit: .delete, forRowAt: indexPath)
        let newScore2 = erTableVC.deleteFlag
        XCTAssertEqual(newScore2, false)
        
        erTableVC.sortedFlag = true
        erTableVC.closedFlag = true
        erTableVC.tableView(erTableVC.tableView, commit: .delete, forRowAt: indexPath)
        let newScore3 = erTableVC.deleteFlag
        XCTAssertEqual(newScore3, false)
    }
    
    func test_SortedAndClosedFlagFalse() {
        erTableVC.sortedFlag = false
        erTableVC.closedFlag = false
        var indexPath = IndexPath(row: 0, section: 0)
        erTableVC.deletedReminders[indexPath.row] = 1
        erTableVC.tableView(erTableVC.tableView, commit: .delete, forRowAt: indexPath)
        let newScore = erTableVC.deleteFlag
        XCTAssertEqual(newScore, true)
    }
    
    func test_DeleteTrueWithAddToClosedReminders(){
        var indexPath = IndexPath(row: 0, section: 0)
        erTableVC.deletedReminders[indexPath.row] = 1
        erTableVC.tableView(erTableVC.tableView, commit: .delete, forRowAt: indexPath)
        let newScore = erTableVC.deleteFlag
        XCTAssertEqual(newScore, true)
    }
    
    func test_DeleteTrueWithoutAddToClosedReminder(){
        var indexPath = IndexPath(row: 0, section: 0)
        erTableVC.deletedReminders[indexPath.row] = 0
        erTableVC.tableView(erTableVC.tableView, commit: .delete, forRowAt: indexPath)
        let newScore = erTableVC.deleteFlag
        XCTAssertEqual(newScore, true)
    }
    
    /*
    func test_AddToClosedReminders() {
        erTableVC.sortedFlag = false
        erTableVC.closedFlag = false
        var indexPath = IndexPath(row: 0, section: 0)
        let sizeBefore = erTableVC.closedReminders.count
        erTableVC.deletedReminders[indexPath.row] = 1
        erTableVC.tableView(erTableVC.tableView, commit: .delete, forRowAt: indexPath)
        let newScore = erTableVC.deleteFlag
        XCTAssertEqual(newScore, true)
        
        let sizeAfter = erTableVC.closedReminders.count
        
        XCTAssertEqual(sizeAfter-sizeBefore, 1)
    }
    */
    
    func test_NotAddToClosedReminders() {
        erTableVC.sortedFlag = false
        erTableVC.closedFlag = false
        var indexPath = IndexPath(row: 0, section: 0)
        let sizeBefore = erTableVC.closedReminders.count
        erTableVC.deletedReminders[indexPath.row] = 0
        erTableVC.tableView(erTableVC.tableView, commit: .delete, forRowAt: indexPath)
        let newScore = erTableVC.deleteFlag
        XCTAssertEqual(newScore, true)
        
        let sizeAfter = erTableVC.closedReminders.count
        
        XCTAssertEqual(sizeAfter, sizeBefore)
    }
    
}
