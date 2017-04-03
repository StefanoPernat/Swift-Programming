import Cocoa

//  one way to declare a Dictionary<String, Int>
var movieRatings = ["Donnie Darko": 4, "Chungking Express": 5, "Dark City": 4]

/*
    var dict1:  Dictionary<String, Double> =   [:]
    var dict2   =   Dictionary<String, Double>()
    var dict3:  [String: Double]    =   [:]
    var dict4   = [String: Double]()
*/

print("I have rated \(movieRatings.count) movies")

//  Reading a value from a dictionary
let darkoRating = movieRatings["Donnie Darko"]
let braveheartRating = movieRatings["Braveheart"]

//  Modifying a value
movieRatings["Dark City"] = 5
movieRatings

if let oldRating = movieRatings.updateValue(5, forKey: "Donnie Darko"), let currentRating = movieRatings["Donnie Darko"] {
    print("Old Rating: \(oldRating); Current Rating: \(currentRating)")
}

//  Adding and Removing values
movieRatings["The Cabinet of Dr. Caligari"] = 5
//movieRatings.removeValue(forKey: "Dark City") or
movieRatings["Dark City"] = nil

print()

//  looping
for (key, value) in movieRatings {
    print("The movie \(key) was rated \(value).")
}

print()

for movie in movieRatings.keys {
    print("User has rated \(movie)")
}

//  Immutable Dictionaries
let album = [
    "Diet Roast Beef": 268,
    "Dubba Dubbs Stubs Hit Toe": 467,
    "Smokey's Carpet Cleaning Service": 187,
    "Track 4": 221
]

let watchedMovies = Array(movieRatings.keys)
