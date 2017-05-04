//
//  main.swift
//  MonsterTown
//
//  Created by Stefano Pernat on 26/04/17.
//  Copyright © 2017 Stefano Pernat. All rights reserved.
//

import Foundation

var myTown = Town(population: 0, stoplights: 6)
let myTownSize = myTown?.townSize
print(myTownSize)
myTown?.changePopulation(by: 1_000_000)
print("Size: \(myTown?.townSize); population: \(myTown?.population)")
myTown?.printDescription()
let fredTheZombie = Zombie(limp: false, fallingApart: false, town: myTown, monsterName: "Fred")
fredTheZombie?.terrorizeTown()
fredTheZombie?.town?.printDescription()

var anotherTown = Town(region: "South", population: 56, stoplights: 3)
anotherTown?.population = 15
anotherTown?.printDescription()
let alfredTheZombie = Zombie(limp: false, fallingApart: false, town: anotherTown, monsterName: "Alfred")
alfredTheZombie?.terrorizeTown()
alfredTheZombie?.town?.printDescription()
alfredTheZombie?.terrorizeTown()
alfredTheZombie?.town?.printDescription()

print("Victim pool: \(fredTheZombie?.victimPool)")
fredTheZombie?.victimPool = 500
print("Victim pool: \(fredTheZombie?.victimPool)")
print(Zombie.spookyNoise)

if Zombie.isTerrifying {
    print("Run away...")
}


var convenientZombie: Zombie? = Zombie(limp: true, fallingApart: false)
convenientZombie = nil
