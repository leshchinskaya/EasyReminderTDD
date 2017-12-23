//
//  UpdateReminderViewController.swift
//  EasyReminderTDD
//
//  Created by Marie on 23.12.17.
//  Copyright © 2017 Mariya. All rights reserved.
//

import UIKit
import CoreData

class UpdateReminderViewController: UIViewController {
    
    var newIndexPrec = 0
    var newTitle: String?
    var newDescrip : String?
    var newDate: Date?
    var newLocation: String?

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var descripTextView: UITextView!
    
    @IBOutlet weak var dateTextField: UITextField!
    
    @IBAction func datePickerAction(_ sender: Any) {
        
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        var strDate = dateFormatter.string(from: datePicker.date)
        self.dateTextField.text = strDate
        
    }
    
    @IBAction func changeIndex(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            newIndexPrec = 0
            print("No precedence");
        case 1:
            newIndexPrec = 1
            print("!!!")
        case 2:
            newIndexPrec = 2
            print("!!")
        case 3:
            newIndexPrec = 3
            print("!")
        default:
            break;
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
