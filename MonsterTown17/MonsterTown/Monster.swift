//
//  Monster.swift
//  MonsterTown
//
//  Created by Stefano Pernat on 29/04/17.
//  Copyright © 2017 Stefano Pernat. All rights reserved.
//

import Foundation

class Monster {
    static let isTerrifying = true
    class var spookyNoise: String {
        return "Grrr..."
    }
    
    var town: Town?
    var name: String
    var victimPool: Int {
        get {
            return town?.population ?? 0
        }
        set(newVictimPool) {
            town?.population = newVictimPool
        }
    }
    
    // Gold Challenge
    required init?(town: Town?, monsterName: String) {
        guard monsterName != "" else {
            return nil
        }
        
        self.town = town
        name = monsterName
    }
    
    func terrorizeTown() {
        if town != nil {
            print("\(name) is terrorizing a town!")
        } else {
            print("\(name) hasn't found a town to terrorize yet...")
        }
    }
}
