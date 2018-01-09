//
//  ERTableViewController.swift
//  EasyReminderTDD
//
//  Created by Marie on 23.12.17.
//  Copyright © 2017 Mariya. All rights reserved.
//

import UIKit
import CoreData
import CheckBox

class ERTableViewController: UITableViewController {
    @IBOutlet weak var chkReminder: CheckBox!
    
    let dateFormatter = DateFormatter()
    let searchController = UISearchController(searchResultsController: nil)
    
    var reminders : [Reminder] = []
    var filteredReminders = [AnyObject]()
    var sortedReminders = [AnyObject]()
    var closedReminders = [AnyObject]()
    
    var f = false
    var sortedFlag = false
    var closedFlag = false
    var kolClosed = 1
    var kolFiltered = 1

    @IBAction func closed(_ sender: UIButton) {
        kolClosed += 1
        if (kolClosed % 2 == 0) {
            print ("closed")
            closedFlag = true
            tableView.reloadData()
        }
        else {
            print ("not closed")
            closedFlag = false
            tableView.reloadData()
        }
        
    }
    @IBAction func update(_ sender: Any) {
        
        kolFiltered += 1
        if (kolFiltered % 2 == 0) {
            print ("filtered")
            sortedReminders = reminders.sorted(by: { $0.precedence < $1.precedence})
            print (sortedReminders)
            sortedFlag = true
            tableView.reloadData()
        }
        else {
            print ("not filtered")
            sortedFlag = false
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //chk.onClick = { (checkbox) in
        //    print(checkbox.isChecked)
       //}
        
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Reminders"
        navigationItem.searchController = searchController
        //navigationItem.titleView = searchController.searchBar
        definesPresentationContext = true
        
        addInitReminder()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //navigationController?.navigationBar.prefersLargeTitles = true
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    func addInitReminder(){
        let testReminder1 = NSEntityDescription.insertNewObject(forEntityName: "Reminder", into: context) as! Reminder
        let testReminder2 = NSEntityDescription.insertNewObject(forEntityName: "Reminder", into: context) as! Reminder
         let testReminder3 = NSEntityDescription.insertNewObject(forEntityName: "Reminder", into: context) as! Reminder

        dateFormatter.dateFormat = "MM-dd-yyyy"
    
        testReminder1.setValue("title one", forKey: "title")
        testReminder1.setValue(3, forKey: "precedence")
        testReminder1.setValue("Voronezh", forKey: "location")
        testReminder1.setValue("Description1", forKey: "descrip")
        testReminder1.setValue(dateFormatter.date(from: "11-10-2018"), forKey: "date")
        reminders.append(testReminder1)
        
        testReminder2.setValue("title two", forKey: "title")
        testReminder2.setValue(2, forKey: "precedence")
        testReminder2.setValue("Voronezh", forKey: "location")
        testReminder2.setValue("Description2", forKey: "descrip")
        testReminder2.setValue(dateFormatter.date(from: "10-10-2018"), forKey: "date")
        reminders.append(testReminder2)
        
        testReminder3.setValue("title three", forKey: "title")
        testReminder3.setValue(1, forKey: "precedence")
        testReminder3.setValue("San-Francisco", forKey: "location")
        testReminder3.setValue("Description3", forKey: "descrip")
        testReminder3.setValue(dateFormatter.date(from: "10-11-2019"), forKey: "date")
        reminders.append(testReminder3)
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
/*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
*/
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredReminders.count
        }
        if sortedFlag {
            return sortedReminders.count
        }
        if closedFlag {
            return closedReminders.count
        }
        return reminders.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        dateFormatter.dateFormat = "MM-dd-yyyy"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        if isFiltering() {
            let reminder = filteredReminders[indexPath.row]
            cell.textLabel!.text = reminder.value(forKey: "title") as? String
            cell.detailTextLabel!.text = dateFormatter.string(from: reminder.value(forKey: "date") as! Date)
            
        } else
        if sortedFlag {
            let reminder = sortedReminders[indexPath.row]
            cell.textLabel!.text = reminder.value(forKey: "title") as? String
            cell.detailTextLabel!.text = dateFormatter.string(from: reminder.value(forKey: "date") as! Date)
        }
        else if closedFlag {
            if (closedReminders.count != 0) {
                let reminder = closedReminders[indexPath.row]
                cell.textLabel!.text = reminder.value(forKey: "title") as? String
                cell.detailTextLabel!.text = dateFormatter.string(from: reminder.value(forKey: "date") as! Date)
            }
            else {
                closedFlag = false
                kolClosed = 1
                tableView.reloadData()
            }
        }
        else {
            let reminder = reminders[indexPath.row]
            cell.textLabel!.text = reminder.value(forKey: "title") as? String
            cell.detailTextLabel!.text = dateFormatter.string(from: reminder.value(forKey: "date") as! Date)
        }
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
            if (indexPath.row >= reminders.count) {
                print ("error")
                f = false
            }
            else if (indexPath.row < 0) {
                print("error")
                f = false
            }
            else {
                f = true
                let delReminder = reminders[indexPath.row]
                closedReminders.append(delReminder)
                reminders.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
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

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "updateReminder", sender: indexPath)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destVC = segue.destination as? NewReminderViewController, segue.identifier == "addNewReminder" {
            sortedFlag = false
            closedFlag = false
            print("addNewReminder")
            //destVC.reminders = reminders
            //let reminder = Reminder()
            //reminders.append(reminder)
            destVC.delegate = self
            //destVC.reminder = reminder
        }
        if let destVC = segue.destination as? UpdateReminderViewController, segue.identifier == "updateReminder" {
            print ("updateReminder")
            
            //destVC.reminders = reminders
            
            if sortedFlag {
                guard
                    let reminder = sortedReminders[(sender as! IndexPath).row] as? Reminder,
                    let indexPath = sender as? IndexPath else { return }
                destVC.reminder = reminder
                destVC.indexPath = indexPath
                destVC.delegate = self
            
            } else if closedFlag {
                guard
                    let reminder = closedReminders[(sender as! IndexPath).row] as? Reminder,
                    let indexPath = sender as? IndexPath else { return }
                destVC.reminder = reminder
                destVC.indexPath = indexPath
                destVC.delegate = self
            } else {
                guard
                    let reminder = reminders[(sender as! IndexPath).row] as? Reminder,
                    let indexPath = sender as? IndexPath else { return }
                destVC.reminder = reminder
                destVC.indexPath = indexPath
                destVC.delegate = self
            }
        }
        
    }
    
    
    
    // MARK: - CoreData
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // MARK: - Private instance methods
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
       filteredReminders = reminders.filter({( reminder : Reminder) -> Bool in
        //print(filteredReminders)
        return (reminder.title?.lowercased().contains(searchText.lowercased()))!
        //let title = reminder.title! as String
        //return reminder.title.ranngeOfString(searchText)
        
        })
        tableView.reloadData()
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }

}

extension ERTableViewController: NewReminderViewControllerDelegate {
    func newReminderViewController(_ newReminderViewController: NewReminderViewController, didAddReminder reminder: Reminder) {
        //print(reminder.title + " " + reminder.descrip)
        reminders.append(reminder)
        tableView.reloadData()
        
    }
}

extension ERTableViewController: UpdateReminderViewControllerDelegate {
    func updateReminderViewController(_ updateReminderViewController: UpdateReminderViewController, didEditReminder reminder: Reminder, at indexPath: IndexPath) {
        reminders[indexPath.row] = reminder
        tableView.reloadData()
    }
}

extension ERTableViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        // TODO
        filterContentForSearchText(searchController.searchBar.text!)
    }
}
