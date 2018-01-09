//
//  UpdateReminderViewController.swift
//  EasyReminderTDD
//
//  Created by Marie on 23.12.17.
//  Copyright © 2017 Mariya. All rights reserved.
//

import UIKit
import CoreData

protocol UpdateReminderViewControllerDelegate: class {
    func updateReminderViewController(_ updateReminderViewController: UpdateReminderViewController, didEditReminder reminder: Reminder, at indexPath: IndexPath)
}

class UpdateReminderViewController: UIViewController {
    
    let dateFormatter = DateFormatter()
    var indexOld = 0
    var newIndexPrec = 0
    var newTitle: String?
    var newDescrip : String?
    var newDate: Date?
    var newLocation: String?
    var f = false
    
    
    weak var delegate: UpdateReminderViewControllerDelegate?
    
    var reminder: Reminder?
    var indexPath: IndexPath?
    
    var reminders = [Reminder]()

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
            reminder?.title = newTitle
            reminder?.descrip = newDescrip
            reminder?.location = newLocation
            reminder?.date = newDate! as NSDate
            reminder?.precedence = Int16(newIndexPrec)
            
            print("save changes")
            //print(reminder!)
            
            guard let reminder = reminder, let indexPath = indexPath else {
                return
            }
            delegate?.updateReminderViewController(self, didEditReminder: reminder, at: indexPath)
            dismiss(animated: true, completion: nil)
            navigationController?.popViewController(animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (reminder != nil) {
            titleTextField.text = reminder?.title
            descripTextView.text = reminder?.descrip
            locationTextField.text = reminder?.location
            dateFormatter.dateFormat = "MM-dd-yyyy"
            dateTextField.text = dateFormatter.string(from: (reminder?.date)! as Date)
            let prec : Int = Int((reminder?.precedence)!)
            segmentedControl.selectedSegmentIndex = prec
        }
        
        // Do any additional setup after loading the view.
        //navigationController?.navigationBar.prefersLargeTitles = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destVC = segue.destination as? MapViewController, segue.identifier == "showLocation" {
            print("showLocation")
            destVC.location = locationTextField.text ?? ""
        }
    }
    

}
