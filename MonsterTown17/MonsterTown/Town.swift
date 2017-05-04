//
//  Town.swift
//  MonsterTown
//
//  Created by Stefano Pernat on 26/04/17.
//  Copyright © 2017 Stefano Pernat. All rights reserved.
//

import Foundation

struct Town {
    let region: String
    var population: Int {
        didSet(oldPopulation) {
            // Bronze Challenge
            if population < oldPopulation {
                print("The population has changed to \(population) from \(oldPopulation).")
            }
        }
    }
    var numberOfStopLights: Int
    
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
    
    init?(region: String, population: Int, stoplights: Int) {
        guard population > 0 else {
            return nil
        }
        self.region = region
        self.population = population
        self.numberOfStopLights = stoplights
    }
    
    init?(population: Int, stoplights: Int) {
        self.init(region: "N/A", population: population, stoplights: stoplights)
    }
    
    func printDescription() {
        print("Population: \(population); number of stoplights: \(numberOfStopLights); region: \(region)")
    }
    
    // Bronze Challenge Fixing change population method
    mutating func changePopulation(by amount: Int) {
        population += amount
        
        if population < 0 {
            population = 0
        }
    }
}
