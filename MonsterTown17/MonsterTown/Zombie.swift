//
//  Zombie.swift
//  MonsterTown
//
//  Created by Stefano Pernat on 29/04/17.
//  Copyright © 2017 Stefano Pernat. All rights reserved.
//

import Foundation

class Zombie: Monster {
    var walkWithLimp: Bool
    override class var spookyNoise: String {
        return "Brains..."
    }
    
    private(set) var isFallingApart: Bool
    
    init?(limp: Bool, fallingApart: Bool, town: Town?, monsterName: String) {
        isFallingApart = fallingApart
        walkWithLimp = limp
        super.init(town: town, monsterName: monsterName)
    }
    
    convenience init?(limp: Bool, fallingApart: Bool) {
        self.init(limp: limp, fallingApart: fallingApart, town: nil, monsterName: "Fred")
        if walkWithLimp {
            print("This zombie has a bad knee.")
        }
    }
    
    // Silver Challenge
    convenience required init?(town: Town?, monsterName: String) {
        self.init(limp: false, fallingApart: false, town: town, monsterName: monsterName)
    }
    
    deinit {
        print("Zombie named \(name) is not longer with us.")
    }
    
    // Bronze Challenge fixing Zombie class
    final override func terrorizeTown() {
        if let currentPopulation = town?.population, currentPopulation > 0 {
            town?.changePopulation(by: -10)
        }
        
        super.terrorizeTown()
    }
}
