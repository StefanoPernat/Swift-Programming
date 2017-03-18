import Cocoa

var population: Int = 5422                      //  variable declared with explicit Int type
var message: String                             //  variable declared with explicit String type
var hasPostOffice: Bool = true

if population < 10000 {                         //  if statement, it evaluates a Bool condition
    message = "\(population) is a small town!"  //  String interpolation
} else if population >= 10000 && population < 50000 {
    message = "\(population) is a medium town"
} else if population >= 50000 && population < 100000 {
        message = "\(population) is pretty big!"
} else {
    message = "\(population) is a very large town"
}

// BRONZE CHALLENGE:    Add an additional else if to the town-sizing code to see if your town population's
//                      is very large

//  The ternary operator
//message = population < 10000 ? "\(population) is  a small town!" : "\(population) is pretty big!"

print(message)

if !hasPostOffice {                             //  if statement without else
    print("Where do we buy stamps?")
}