//
//  ViewController.swift
//  Todoey
//
//  Created by Jon on 6/19/18.
//  Copyright © 2018 SheerCold. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    //Hardcoded array items... BLEH
    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Find"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Destroy"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Win"
        itemArray.append(newItem3)
        
        if let items = defaults.array(forKey: "ToDoListArray") as? [Item]{

            itemArray = items
    }
    
        
    }

    //MARK: - TableView Datasource Methods
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
/////Using a Ternary operator to replace the bottom code doing the same thing but shorter code
        
        cell.accessoryType = item.done ? .checkmark : .none
        
//
//
//        if item.done == true {
//            cell.accessoryType = .checkmark
//        } else {
//            cell.accessoryType = .none
//        }
//////
        
        return cell
    }
    
    //MARK: - TableViewDelegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
        
        //Sets the opposite of the boolean
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        

        tableView.reloadData()
        
        //Removing and adding the checkmarks
//        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark
//        {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .none
//
//        } else {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//
//        }
//
        
        //Removing the persistent gray when selected
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
    //MARK: - Add new items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //What happends once the user hits the add button item
           
            //Creating a new item using item objects vs hard coded array
            let newItem = Item()
            newItem.title = textField.text!
            
            
            //Adding the new item from the user to the table
            self.itemArray.append(newItem)
            //Saving New Item Part 1
            self.defaults.set(self.itemArray, forKey: "ToDoListArray")
            //REQUIRED FOR TABLE TO LOAD NEW INPUT
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            //Creating a textfield to the button with a background placeholder
            alertTextField.placeholder = "Create new item!"
            textField = alertTextField
            
            
        }
        
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            
        
    }
    
    
}

