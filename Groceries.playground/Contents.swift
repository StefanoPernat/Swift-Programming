import Cocoa

//  a way to declare a Set of Strings
//  var groceriesBag = Set<String>()

//  another way to declare a Set
//  var groceriesBag = Set(["Apple", "Oranges", "Pineapple"])

//  third way to declare a Set
var groceriesBag: Set = ["Apple", "Oranges", "Pineapple"]

//  groceriesBag.insert("Apple")
//  groceriesBag.insert("Oranges")
//  groceriesBag.insert("Pineapple")

for food in groceriesBag {
    print(food)
}

let hasBananas = groceriesBag.contains("Bananas")
let friendGroceryBag = Set(["Bananas", "Cereal", "Milk", "Oranges"])
let commonGroceryBag = groceriesBag.union(friendGroceryBag)
let roommatesGroceryBag = Set(["Apples", "Bananas", "Cereal", "Toothpaste"])
let itemsToReturn = commonGroceryBag.intersection(roommatesGroceryBag)

let yourSecondBag = Set(["Barries", "Yogurt"])
let roommateSecondBag = Set(["Grapes", "Honey"])
let disjoint = yourSecondBag.isDisjoint(with: roommateSecondBag)

//  Bronze Challenge
let myCities = Set(["Atlanta", "Chicago", "Jacksonville", "New York", "San Francisco"])
let yourCities = Set(["Chicago", "San Francisco", "Jacksonville"])

yourCities.isSubset(of: myCities)

//  Silver Challenge
groceriesBag.formUnion(friendGroceryBag)
groceriesBag