import Cocoa

// a basic function
func printGreeting() {
    print("Hello, playground.")
}

printGreeting()

// a function with external parameter (different parameter name for the caller)
//func printPersonalGreeting(to name: String){
//    print("Hello \(name), welcome to your playground.")
//}

//printPersonalGreeting(to: "Stefano")

// function with default values
//func divisionDescriptionFor(numerator: Double, denominator: Double, withPunctuation punctuation: String = ".") {
//    print("\(numerator) divided by \(denominator) equals to \(numerator / denominator)\(punctuation)")
//}

//divisionDescriptionFor(numerator: 9.0, denominator: 3.0)
//divisionDescriptionFor(numerator: 9.0, denominator: 3.0, withPunctuation: "!")

// function with variadic parameters
func printPersonalGreetings(to names: String...) {
    for name in names {
        print("Hello \(name), welcome to the playground.")
    }
}

printPersonalGreetings(to: "Stefano", "Claudia", "Matteo", "Michele")

// in-out parameters impact on a variable out of the scope of the function
// in-out parameters cannot have default values and cannot be variadic
var error = "The request failed:"

func appendErrorCode(_ code: Int, toErrorString errorString: inout String){
    if code == 400 {
        errorString += " bad request."
    }
}

appendErrorCode(400, toErrorString: &error)
error

// returning from a function

func divisionDescriptionFor(numerator: Double, denominator: Double, withPunctuation punctuation: String = ".") -> String {
    return "\(numerator) divided by \(denominator) equals to \(numerator / denominator)\(punctuation)"
}

print(divisionDescriptionFor(numerator: 9.0, denominator: 3.0, withPunctuation: "!"))

// nested functions and scope
func areaOfTriangleWith(base: Double, height: Double) -> Double {
    let numerator = base * height
    
    func divide() -> Double{
        return numerator / 2
    }
    
    return divide()
}

areaOfTriangleWith(base: 3.0, height: 5.0)

// function that return something
func sortedEvenOddNumbers(numbers: [Int]) -> (evens: [Int], odds: [Int]) {
    var evens = [Int]()
    var odds = [Int]()
    
    for number in numbers {
        if number % 2 == 0 {
            evens.append(number)
        } else {
            odds.append(number)
        }
    }
    
    return (evens, odds)
}

let aBunchOfNumbers = [10, 1, 4, 3, 57, 43, 84, 27, 156, 111]
let theSortedNumbers = sortedEvenOddNumbers(numbers: aBunchOfNumbers)

print("The even numbers are: \(theSortedNumbers.evens); the odd numbers are \(theSortedNumbers.odds)")

func grabMiddleName(fromFullName name: (String, String?, String)) -> String? {
    return name.1
}

let middleName = grabMiddleName(fromFullName: ("Stefano", nil, "Pernat"))
if let theName = middleName {
    print(theName)
}

// function with guard statement
// refactor for Bronze Challenge
func greetByMiddleName(fromFullName name: (first: String, middle: String?, last: String)) {
    guard let middleName = name.middle, middleName.characters.count < 4 else {   // if true execution continue else print hey there and return
        print("Hey there!")
        return
    }
    print("Hey \(middleName)")
}

greetByMiddleName(fromFullName: ("Matt", "Dan", "Mathias"))

func siftsBeans(fromGroceryList list: [String]) -> (beans: [String], otherGroceries: [String]) {
    var beans = [String]()
    var otherGroceries = [String]()
    
    for grocery in list {
        if grocery.localizedCaseInsensitiveContains("beans") {
            beans.append(grocery)
        } else {
            otherGroceries.append(grocery)
        }
    }
    
    return (beans, otherGroceries)
}

let result = siftsBeans(fromGroceryList: ["green beans", "milk", "black beans", "pinto beans", "apples"])
print(result.beans)
print(result.otherGroceries)
