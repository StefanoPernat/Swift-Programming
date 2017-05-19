//
//  ViewController.swift
//  iTahDoodle
//
//  Created by Stefano Pernat on 18/05/17.
//  Copyright © 2017 Stefano Pernat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let todoList = TodoList()
    
    @IBOutlet var itemTextField: UITextField!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Silver Challenge
        tableView.register(todoList.cellType, forCellReuseIdentifier: todoList.cellIdentifier)
        tableView.dataSource = todoList
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        // Bronze Challenge
        guard let todo = itemTextField.text, todo != "" else {
            return
        }
        
        todoList.add(todo)
        tableView.reloadData()
        itemTextField.text = ""
    }
}

// Gold Challenge
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        todoList.removeItem(at: indexPath.item)
        tableView.reloadData()
        
    }
}
