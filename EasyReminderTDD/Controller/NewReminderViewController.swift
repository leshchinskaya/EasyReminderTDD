//
//  NewReminderViewController.swift
//  EasyReminderTDD
//
//  Created by Marie on 23.12.17.
//  Copyright © 2017 Mariya. All rights reserved.
//

import UIKit
import CoreData

protocol NewReminderViewControllerDelegate: class  {
    func newReminderViewController(_ newReminderViewController: NewReminderViewController, didAddReminder reminder: Reminder)
}

class NewReminderViewController: UIViewController {
    
    weak var delegate: NewReminderViewControllerDelegate?
    
    let dateFormatter = DateFormatter()
    var newIndexPrec = 0
    var newTitle: String?
    var newDescrip : String?
    var newDate: Date?
    var newLocation: String?
    
    var reminders = [Reminder]()
    //var reminder: Reminder?
    
    var f = false
    var fIndex = false
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var descripTextView: UITextView!
    @IBOutlet weak var dateTextField: UITextField!
    
    @IBAction func datePickerAction(_ sender: Any) {
        dateFormatter.dateFormat = "MM-dd-yyyy"
        let strDate = dateFormatter.string(from: datePicker.date)
        self.dateTextField.text = strDate
    }
    
    
    @IBAction func indexPrecedence(_ sender: UISegmentedControl) {
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
    
    @IBAction func save() {
        
        newTitle = titleTextField.text
        newDescrip = descripTextView.text
        newLocation = locationTextField.text
        newDate = dateFormatter.date(from: dateTextField.text!)
        
        if (newTitle=="") {
            f=false
            print("error: title == nil")
            
        }
        else {
            f = true
            let testReminder = NSEntityDescription.insertNewObject(forEntityName: "Reminder", into: context) as! Reminder
            
            dateFormatter.dateFormat = "MM-dd-yyyy"
            
            
            testReminder.setValue(newTitle, forKey: "title")
            testReminder.setValue(newIndexPrec, forKey: "precedence")
            testReminder.setValue(newLocation, forKey: "location")
            testReminder.setValue(newDescrip, forKey: "descrip")
            testReminder.setValue(newDate, forKey: "date")
            reminders.append(testReminder)
            
            /*
            reminder?.setValue(newTitle, forKey: "title")
            reminder?.setValue(newIndexPrec, forKey: "precedence")
            reminder?.setValue(newLocation, forKey: "location")
            reminder?.setValue(newDescrip, forKey: "descrip")
            reminder?.setValue(newDate, forKey: "date")
            */
            print("save new reminder")
            print(reminders.count)
            
            print(reminders)
            //print(testReminder)
            
            //self.delegate?.newReminderViewController(self, didAddReminder: reminder!)
            self.navigationController?.popViewController(animated: true)
            //self.itemManager?.addItem(item: item)
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationController?.navigationBar.prefersLargeTitles = false
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
    
    // MARK: - CoreData
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

}
