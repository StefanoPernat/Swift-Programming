import Cocoa

let volunteerCounts = [1,3,40,32,2,53,77,13]

// a function is a closure
//func sortAscending(_ i: Int, _ j: Int) -> Bool {
//    return i < j
//}
//
//let volunteersSorted = volunteerCounts.sorted(by: sortAscending)

// rewrite it with closure syntax

//let volunteersSorted = volunteerCounts.sorted(by: {
//    (i: Int, j: Int) -> Bool in
//    return i < j
//})

// a more concise closure syntax, this will take the advantage of Swift type inference

//let volunteersSorted = volunteerCounts.sorted(by: {i,j in i < j})

// closure shorthand syntax

//let volunteersSorted = volunteerCounts.sorted(by: {$0 < $1})

// inline closure (only possible if a closure is the final argument)

// Bronze Challenge I
let volunteersSorted = volunteerCounts.sorted {$0 > $1}

// function as return type

//func makeTownGrand() -> (Int, Int) -> Int {
//    func buildRoads(byAddingLights lights: Int, toExistingLights existingLights: Int) -> Int {
//        return lights + existingLights
//    }
//    
//    return buildRoads(byAddingLights:toExistingLights:)
//}
//
//var stopLights = 4
//let townPlanByAddingLightsToExistingLights = makeTownGrand()
//stopLights = townPlanByAddingLightsToExistingLights(4, stopLights)
//print("Knowere has \(stopLights) stoplights.")

func makeTownGrand(withBudget budget: Int, condition: (Int) -> Bool) -> ((Int, Int) -> Int)?{
    if condition(budget) {
        func buildRoads(byAddingLights lights: Int, toExistingLights existingLights: Int) -> Int {
            return lights + existingLights
        }
        
        return buildRoads(byAddingLights:toExistingLights:)
    } else {
        return nil
    }
}

func evaluate(budget: Int) -> Bool {
    return budget > 10_000
}

var stopLights = 4
if let townPlanByAddingLightsToExistingLights = makeTownGrand(withBudget: 1_000, condition: evaluate(budget:)) {
    stopLights = townPlanByAddingLightsToExistingLights(4, stopLights)
}

if let newTownPlan = makeTownGrand(withBudget: 10_500, condition: evaluate(budget:)) {
    stopLights = newTownPlan(4, stopLights)
}

print("Knowhere has \(stopLights) stoplights.")

// closures that capture values
func makePopulationTracker(forInitialPopulation initialPopulation: Int) -> (Int) -> Int {
    var totalPopulation = initialPopulation
    func populationTracker(growth: Int) -> Int {
        totalPopulation += growth
        return totalPopulation
    }
    return populationTracker(growth:)
}

var currentPopulation = 5_422
let growthBy = makePopulationTracker(forInitialPopulation: currentPopulation)

growthBy(500)
growthBy(500)
growthBy(500)
currentPopulation = growthBy(500)

// closures are reference tyepes
let anotherGrowthBy = growthBy // anotherGrowthBy points to the same function as growthBy
anotherGrowthBy(500)

var bigCityPopulation = 4_061_981
let bigCityGrowBy = makePopulationTracker(forInitialPopulation: bigCityPopulation)
bigCityPopulation = bigCityGrowBy(10_000)
currentPopulation

let precinctPopulation = [1244,2021,2157]
let projectedPopulation = precinctPopulation.map {
    (population: Int) -> Int in
    return population * 2
}

let bigProjection = projectedPopulation.filter {
    (projection: Int) -> Bool in
    return projection > 4000
}

let totalProjections = projectedPopulation.reduce(0) {
    (accumulatedProjection: Int, precinctPop: Int) -> Int in
    return accumulatedProjection + precinctPop
}

// Bronze Challenge II
volunteersSorted.sorted()

// Gold Challenge
print(projectedPopulation.reduce(0) {$0 + $1})