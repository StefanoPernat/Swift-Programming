//
//  TodoList.swift
//  iTahDoodle
//
//  Created by Stefano Pernat on 19/05/17.
//  Copyright © 2017 Stefano Pernat. All rights reserved.
//

import UIKit

class TodoList: NSObject {
    fileprivate var items: [String] = []
    
    
    private let fileURL: URL = {
        let documentDirectoryURLs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectoryURL = documentDirectoryURLs.first!
        
        return documentDirectoryURL.appendingPathComponent("todolist.items")
    }()
    
    var cellType: AnyClass {
        return UITableViewCell.self
    }
    
    var cellIdentifier: String {
        return "Cell"
    }
    
    override init() {
        super.init()
        loadItems()
    }
    
    func add(_ item: String) {
        items.append(item)
        saveItems()
    }
    
    // Gold Challenge
    func removeItem(at index: Int) {
        items.remove(at: index)
        saveItems()
    }
    
    func saveItems() {
        let itemsArray = items as NSArray
        
        print("Saving items to \(fileURL)")
        if !itemsArray.write(to: fileURL, atomically: true) {
            print("Could not save to-do list")
        }
    }
    
    func loadItems() {
        if let itemsArray = NSArray(contentsOf: fileURL) as? [String] {
            items = itemsArray
        }
    }
}

extension TodoList: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item = items[indexPath.row]
        
        cell.textLabel!.text = item
        
        return cell
    }
}
