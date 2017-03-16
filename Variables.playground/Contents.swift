import Cocoa

//  The compiler uses type inference to infer the type of a variable or constant
//  The type can be declared explicitly with the : operator

//  In Swift constants are declared with the let keyword, and its value cannot be change

let numberOfStopLights: Int = 4
var population: Int
population = 5422
let townName = "Knowhere"

/*
 BRONZE CHALLENGE TWO
 
 Add a variable to your playground representing Knowhere's level of unemployment
 What type of variable should you use?
 Update the description...
 */
var levelOfUnemployment: Double = 0.11


//  with sring interpolation we can insert the value of methods, constants or variables inside a String \() represent a placeholder
let townDescription = "\(townName) has a population of \(population) and \(numberOfStopLights) stoplights.\nThe level of unemployment is \(levelOfUnemployment * 100)%"