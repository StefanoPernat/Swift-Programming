//
//  main.swift
//  MonsterTown
//
//  Created by Stefano Pernat on 26/04/17.
//  Copyright © 2017 Stefano Pernat. All rights reserved.
//

import Foundation

var myTown = Town()
myTown.changePopulation(by: 500)
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
