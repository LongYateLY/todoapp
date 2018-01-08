//
//  ViewController.swift
//  todoapp
//
//  Created by SteveWayne on 1/5/18.
//  Copyright © 2018 aungthuphyo. All rights reserved.
//

import UIKit

class TodolistVC: UITableViewController {
    
    var listArray = ["lesson1","lesson2","lesson3"]
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let item = defaults.array(forKey: "TodoListArray") as? [String] {
            listArray = item
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todolistCell", for: indexPath)
         cell.textLabel?.text = listArray[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // print(listArray[indexPath.row])
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    //Mark - Bar button add
    @IBAction func barButtonAdd(_ sender: UIBarButtonItem) {
        var textFelfd = UITextField()
        
        let arlent = UIAlertController(title: "Add something", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "add", style: .default) { (action) in
            self.listArray.append(textFelfd.text!)
            self.defaults.setValue(self.listArray, forKey: "TodoListArray")
            self.tableView.reloadData()
        }
        arlent.addTextField { (alertTextField) in
            alertTextField.placeholder = "something"
            textFelfd = alertTextField
      
        }
        
        arlent.addAction(action)
        present(arlent, animated: true, completion: nil)
        
        
    }
    
    
    
}

