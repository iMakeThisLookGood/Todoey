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
    let itemArray = ["Find", "Destroy","Win"]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK: - TableView Datasource Methods
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    //MARK: - TableViewDelegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        

        
        //Removing and adding the checkmarks
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none

        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark

        }
        
        
        //Removing the persistent gray when selected
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
    

}

