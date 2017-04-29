//
//  Zombie.swift
//  MonsterTown
//
//  Created by Stefano Pernat on 29/04/17.
//  Copyright © 2017 Stefano Pernat. All rights reserved.
//

import Foundation

class Zombie: Monster {
    var walkWithLimp = true
    
    // Bronze Challenge fixing Zombie class
    final override func terrorizeTown() {
        if let currentPopulation = town?.population, currentPopulation > 0 {
            town?.changePopulation(by: -10)
        }
        
        super.terrorizeTown()
    }
}
