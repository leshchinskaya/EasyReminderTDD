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
    
    @IBOutlet weak var showClosedButton: UIButton!
    @IBOutlet weak var filterButton: UIButton!
    
    let dateFormatter = DateFormatter()
    let searchController = UISearchController(searchResultsController: nil)
    
    let employeeReminder = NSFetchRequest<NSFetchRequestResult>(entityName: "Reminder")
    
    var reminders : [Reminder] = []
    var filteredReminders = [AnyObject]()
    var sortedReminders = [AnyObject]()
    var closedReminders = [AnyObject]()
    //var deletedReminders = [Int]()
    var deletedReminders = [Int](repeating: 0, count: 500)
    
    var deleteFlag = false
    var sortedFlag = false
    var closedFlag = false
    var kolClosed = 1
    var kolFiltered = 1
    
    /*
    @IBAction func chkReminder(_ sender: Any) {
        print("CheckBox")
        let alertController = UIAlertController(title: "Checked", message:
                "Success", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
        
    }
     */
    
    @IBAction func closed(_ sender: UIButton) {
        tableView.reloadData()
        kolClosed += 1
        if (kolClosed % 2 == 0) {
            print ("closed")
            closedFlag = true
            showClosedButton.setTitleColor(.green, for: .normal)
            tableView.reloadData()
        }
        else {
            print ("not closed")
            closedFlag = false
            showClosedButton.setTitleColor(.red, for: .normal)
            tableView.reloadData()
        }
        
    }
    @IBAction func update(_ sender: Any) {
        tableView.reloadData()
        kolFiltered += 1
        if (kolFiltered % 2 == 0) {
            print ("filtered")
            sortedReminders = reminders.sorted(by: { $0.precedence < $1.precedence})
            print (sortedReminders)
            sortedFlag = true
            filterButton.setTitleColor(.green, for: .normal)
            tableView.reloadData()
        }
        else {
            print ("not filtered")
            sortedFlag = false
            filterButton.setTitleColor(.red, for: .normal)
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //deletedReminders = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        //chk.onClick = { (checkbox) in
        //    print(checkbox.isChecked)
       //}
        
        filterButton.setTitleColor(.red, for: .normal)
        showClosedButton.setTitleColor(.red, for: .normal)
        
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Reminders"
        navigationItem.searchController = searchController
        //navigationItem.titleView = searchController.searchBar
        //navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
        
        //addInitReminder()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //navigationController?.navigationBar.prefersLargeTitles = true
        super.viewWillAppear(animated)
        
        let employeeReminder = NSFetchRequest<NSFetchRequestResult>(entityName: "Reminder")
        do {
            let fetchedEmployees = try context.fetch(employeeReminder) as? [Reminder]
            if let results = fetchedEmployees {
                reminders = results
            } else {
                print ("error")
            }
        } catch {
            fatalError("Failed to fetch employees: \(error)")
        }
        
        print ("employeeReminder")
        print(employeeReminder)
        
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
        testReminder1.setValue(0, forKey: "done")
        
        
        do {
            try context.save()
        } catch {
            fatalError("Failure to save context: \(error)")
        }
        reminders.append(testReminder1)
        
        
        testReminder2.setValue("купить хлеба", forKey: "title")
        testReminder2.setValue(2, forKey: "precedence")
        testReminder2.setValue("Voronezh, Lizyukov Street, 75", forKey: "location")
        testReminder2.setValue("черный, нарезной", forKey: "descrip")
        testReminder2.setValue(dateFormatter.date(from: "10-10-2018"), forKey: "date")
        testReminder2.setValue(0, forKey: "done")
        
        do {
            try context.save()
        } catch {
            fatalError("Failure to save context: \(error)")
        }
        reminders.append(testReminder2)
        
        testReminder3.setValue("смета", forKey: "title")
        testReminder3.setValue(1, forKey: "precedence")
        testReminder3.setValue("Voronezh, Lizyukov Street, 79", forKey: "location")
        testReminder3.setValue("по К5, обязательно до 15 января", forKey: "descrip")
        testReminder3.setValue(dateFormatter.date(from: "10-11-2019"), forKey: "date")
        testReminder3.setValue(0, forKey: "done")
        
        do {
            try context.save()
        } catch {
            fatalError("Failure to save context: \(error)")
        }
        reminders.append(testReminder3)
        
        
        print(reminders)
    
    
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! CustomTableViewCell
        
        if isFiltering() {
            let reminder = filteredReminders[indexPath.row]
            
            cell.titleLabel.text = reminder.value(forKey: "title") as? String
            cell.dateLabel.text = dateFormatter.string(from: reminder.value(forKey: "date") as! Date)
            
            //cell.textLabel!.text = reminder.value(forKey: "title") as? String
            //cell.detailTextLabel!.text = dateFormatter.string(from: reminder.value(forKey: "date") as! Date)
            
        } else
        if sortedFlag {
            let reminder = sortedReminders[indexPath.row]
            cell.titleLabel.text = reminder.value(forKey: "title") as? String
            cell.dateLabel.text = dateFormatter.string(from: reminder.value(forKey: "date") as! Date)
            
            //cell.textLabel!.text = reminder.value(forKey: "title") as? String
            //cell.detailTextLabel!.text = dateFormatter.string(from: reminder.value(forKey: "date") as! Date)
        }
        else if closedFlag {
            if (closedReminders.count != 0) {
                let reminder = closedReminders[indexPath.row]
                cell.titleLabel.text = reminder.value(forKey: "title") as? String
                cell.dateLabel.text = dateFormatter.string(from: reminder.value(forKey: "date") as! Date)
                cell.chk.isHidden = true
                
                //cell.textLabel!.text = reminder.value(forKey: "title") as? String
               //cell.detailTextLabel!.text = dateFormatter.string(from: reminder.value(forKey: "date") as! Date)
            }
            else {
                closedFlag = false
                kolClosed = 1
                tableView.reloadData()
            }
        }
        else {
            let reminder = reminders[indexPath.row]
            cell.titleLabel.text = reminder.value(forKey: "title") as? String
            if reminder.value(forKey: "date") == nil {cell.dateLabel.text = ""} else{
            cell.dateLabel.text = dateFormatter.string(from: reminder.value(forKey: "date") as! Date)
            }
            cell.chk.isHidden = false
            
            if (cell.check == 1)
            {
                deletedReminders[indexPath.row] = 1
                deleteFlag = true
                let delReminder = reminders[indexPath.row]
                closedReminders.append(delReminder)
                context.delete(reminders[indexPath.row] as Reminder)
                reminders.remove(at: indexPath.row)
                tableView.reloadData()
                cell.check = 0
                cell.chk.isChecked = false
                do {
                    try context.save()
                } catch {
                    fatalError("Failure to save context: \(error)")
                }
                //cell.check = 0
            }
            else {
                deletedReminders[indexPath.row] = 0
            }
            //cell.textLabel!.text = reminder.value(forKey: "title") as? String
            //cell.textLabel!.text = String(describing: reminder.value(forKey: "done"))
            //cell.detailTextLabel!.text = dateFormatter.string(from: reminder.value(forKey: "date") as! Date)
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
        if  (sortedFlag || closedFlag) {
            deleteFlag = false
            print ("error")
        } else
        if editingStyle == .delete {
            if (indexPath.row >= reminders.count) {
                print ("error")
                deleteFlag = false
            }
            else if (indexPath.row < 0) {
                print("error")
                deleteFlag = false
            }
            else /*{
                if (deletedReminders[indexPath.row] == 1) {
                    deleteFlag = true
                    let delReminder = reminders[indexPath.row]
                    closedReminders.append(delReminder)
                    reminders.remove(at: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: .fade)
                }
                else */{
                    deleteFlag = true
                    context.delete(reminders[indexPath.row] as Reminder)
                    reminders.remove(at: indexPath.row)
                    do {
                        try context.save()
                    } catch {
                        fatalError("Failure to save context: \(error)")
                    }
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
    func newReminderViewController(_ newReminderViewController: NewReminderViewController, didAddReminder reminder: Reminder?) {
        //print(reminder.title + " " + reminder.descrip)
        
        do {
            try context.save()
        } catch {
            fatalError("Failure to save context: \(error)")
        }
        
        reminders.append(reminder!)
        tableView.reloadData()
        
    }
}

extension ERTableViewController: UpdateReminderViewControllerDelegate {
    func updateReminderViewController(_ updateReminderViewController: UpdateReminderViewController, didEditReminder reminder: Reminder, at indexPath: IndexPath) {
        
        do {
            try context.save()
        } catch {
            fatalError("Failure to save context: \(error)")
        }
        
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
