//
//  main.swift
//  CyclicalAssets
//
//  Created by Stefano Pernat on 16/05/17.
//  Copyright © 2017 Stefano Pernat. All rights reserved.
//

import Foundation

var bob: Person? = Person(name: "Bob")
print("created \(bob)")

var laptop: Asset? = Asset(name: "Shiny Laptop", value: 1_500.0)
var hat: Asset? = Asset(name: "Cowboy Hat", value: 175.0)
var backpack: Asset? = Asset(name: "Blue Backpack", value: 45.0)

bob?.useNetWorthChangedHandler {
    netWorth in
    
    print("Bob's net worth is now \(netWorth)")
}

bob?.takeOwnerShip(of: laptop!)
bob?.takeOwnerShip(of: hat!)
print("While bob is alive, hat's owner is \(hat?.owner)")
bob = nil
print("The bob variable is now \(bob)")
print("After Bob is deallocated, hat's owner is \(hat?.owner)")

laptop = nil
hat = nil
backpack = nil
