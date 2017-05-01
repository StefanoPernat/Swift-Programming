//
//  main.swift
//  MonsterTown
//
//  Created by Stefano Pernat on 26/04/17.
//  Copyright © 2017 Stefano Pernat. All rights reserved.
//

import Foundation

var myTown = Town()
let myTownSize = myTown.townSize
print(myTownSize)
myTown.changePopulation(by: 1_000_000)
print("Size: \(myTown.townSize); population: \(myTown.population)")
myTown.printDescription()
let fredTheZombie = Zombie()
fredTheZombie.town = myTown
fredTheZombie.terrorizeTown()
fredTheZombie.town?.printDescription()

var anotherTown = Town()
anotherTown.population = 15
anotherTown.printDescription()
let alfredTheZombie = Zombie()
alfredTheZombie.town = anotherTown
alfredTheZombie.terrorizeTown()
alfredTheZombie.town?.printDescription()
alfredTheZombie.terrorizeTown()
alfredTheZombie.town?.printDescription()

print("Victim pool: \(fredTheZombie.victimPool)")
fredTheZombie.victimPool = 500
print("Victim pool: \(fredTheZombie.victimPool)")
print(Zombie.spookyNoise)

if Zombie.isTerrifying {
    print("Run away...")
}
