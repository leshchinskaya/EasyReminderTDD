//
//  ERTableViewController.swift
//  EasyReminderTDD
//
//  Created by Marie on 23.12.17.
//  Copyright © 2017 Mariya. All rights reserved.
//

import UIKit
import CoreData

class ERTableViewController: UITableViewController {
    
    let dateFormatter = DateFormatter()
    
    var reminders : [NSManagedObject] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addInitReminder()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func addInitReminder(){
        let testReminder1 = NSEntityDescription.insertNewObject(forEntityName: "Reminder", into: context) as NSManagedObject
         let testReminder2 = NSEntityDescription.insertNewObject(forEntityName: "Reminder", into: context) as NSManagedObject

        dateFormatter.dateFormat = "MM-dd-yyyy"
    
        testReminder1.setValue("Title1", forKey: "title")
        testReminder1.setValue(1, forKey: "precedence")
        testReminder1.setValue("Voronezh", forKey: "location")
        testReminder1.setValue("Description1", forKey: "descrip")
        testReminder1.setValue(dateFormatter.date(from: "11-10-2017"), forKey: "date")
        reminders.append(testReminder1)
        
        testReminder2.setValue("Title2", forKey: "title")
        testReminder2.setValue(2, forKey: "precedence")
        testReminder2.setValue("Voronezh", forKey: "location")
        testReminder2.setValue("Description2", forKey: "descrip")
        testReminder2.setValue(dateFormatter.date(from: "10-10-2017"), forKey: "date")
        reminders.append(testReminder2)
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return reminders.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        dateFormatter.dateFormat = "MM-dd-yyyy"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let reminder = reminders[indexPath.row]
        cell.textLabel!.text = reminder.value(forKey: "title") as? String
        cell.detailTextLabel!.text = dateFormatter.string(from: reminder.value(forKey: "date") as! Date)

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //reminders.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

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
