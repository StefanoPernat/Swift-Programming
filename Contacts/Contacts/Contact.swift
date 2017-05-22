//
//  Contact.swift
//  Contacts
//
//  Created by Stefano Pernat on 20/05/17.
//  Copyright © 2017 Stefano Pernat. All rights reserved.
//

import Foundation

class Contact: NSObject {
    let name: String
    
    init(name: String) {
        self.name = name
        super.init()
    }
}
