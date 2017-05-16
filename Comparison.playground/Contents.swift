//: Playground - noun: a place where people can play

import Cocoa

struct Point: Comparable {
    let x: Int
    let y: Int
    
    var distanceFromOrigin: Double {
        let xSquared = Double(x * x)
        let ySquared = Double(y * y)
        
        return sqrt(xSquared + ySquared)
    }
    
    static func ==(lhs: Point, rhs: Point) -> Bool {
        return (lhs.x == rhs.x) && (lhs.y == rhs.y)
    }
    
    static func < (lhs: Point, rhs: Point) -> Bool {
        return lhs.distanceFromOrigin < rhs.distanceFromOrigin
    }
    
    // Bronze Challenge
    static func + (lhs: Point, rhs: Point) -> Point {
        return Point(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
}

let a = Point(x: 3, y: 4)
let b = Point(x: 3, y: 4)

let abEqual = (a == b)
let abNotEqual = (a != b)

let c = Point(x: 2, y: 6)
let d = Point(x: 3, y: 7)

let cdEqual = (c == d)
let cLessThanD = (c < d)
let cGreaterThanD = (c > d)
let cGreaterThanEqualD = (c >= d)

print(a + b)

// Silver Challenge
class Person {
    let name: String
    let age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

extension Person: Equatable {
    static func ==(lhs: Person, rhs: Person) -> Bool {
        return (lhs.name == rhs.name) && (lhs.age == rhs.age)
    }
}

let p1 = Person(name: "Claudia", age: 64)
let p2 = Person(name: "Stefano", age: 27)

let people = [p1, p2]

let p1Index = people.index(where: { $0 == p1})
print(p1Index)