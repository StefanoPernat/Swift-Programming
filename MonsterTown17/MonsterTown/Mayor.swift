//
//  Mayor.swift
//  MonsterTown
//
//  Created by Stefano Pernat on 01/05/17.
//  Copyright © 2017 Stefano Pernat. All rights reserved.
//

import Foundation

// Silver Challenge
struct Mayor {
    internal var name = "Donald J."
    internal var surname = "Trump"
    // Gold Challenge
    private var anxietyLevel = 0
    
    mutating func sendMessageToPopulation() {
        print("Mayor \(surname) says: I'm deeply saddened to hear about this latest tragedy. I promise that my office is looking into the nature of this rash of violence.")
        anxietyLevel += 10
    }
}
