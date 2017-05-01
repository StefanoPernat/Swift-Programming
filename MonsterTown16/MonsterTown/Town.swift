//
//  Town.swift
//  MonsterTown
//
//  Created by Stefano Pernat on 26/04/17.
//  Copyright © 2017 Stefano Pernat. All rights reserved.
//

import Foundation

struct Town {
    static let region = "South"
    var mayor = Mayor()
    var population = 5422 {
        didSet(oldPopulation) {
            // Bronze Challenge
            if population < oldPopulation {
                print("The population has changed to \(population) from \(oldPopulation).")
                mayor.sendMessageToPopulation()
            }
        }
    }
    var numberOfStopLights = 4
    
    enum Size {
        case small
        case medium
        case large
    }
    
    var townSize: Size {
        get {
            switch self.population {
            case 0...10_000:
                return Size.small
            case 10_001...100_000:
                return Size.medium
            default:
                return Size.large
            }
        }
    }
    
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
