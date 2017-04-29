//
//  Town.swift
//  MonsterTown
//
//  Created by Stefano Pernat on 26/04/17.
//  Copyright © 2017 Stefano Pernat. All rights reserved.
//

import Foundation

struct Town {
    var population = 5422
    var numberOfStopLights = 4
    
    func printDescription() {
        print("Population: \(population); number of stoplights: \(numberOfStopLights)")
    }
    
    // Bronze Challenge Fixing change population method
    mutating func changePopulation(by amount: Int) {
        population += amount
        
        if population < 0 {
            population = 0
        }
    }
}
