//
//  Monster.swift
//  MonsterTown
//
//  Created by Stefano Pernat on 29/04/17.
//  Copyright © 2017 Stefano Pernat. All rights reserved.
//

import Foundation

class Monster {
    var town: Town?
    var name = "Monster"
    
    func terrorizeTown() {
        if town != nil {
            print("\(name) is terrorizing a town!")
        } else {
            print("\(name) hasn't found a town to terrorize yet...")
        }
    }
}
