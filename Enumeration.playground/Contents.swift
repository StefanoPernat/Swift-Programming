import Cocoa

// how to define a basic enum
// for defining an enumeration with an underlying type it should be declared as enum TextAlignment: Basic Type
enum TextAlignment: Int {
    case left       = 20
    case right      = 30
    case center     = 40
    case justify    = 50
}

// creating an instance of TextAlignment
//var alignment: TextAlignment = TextAlignment.left
var alignment = TextAlignment.left  // type inference

// changing the value
alignment = .right      // this is possible because of type inference

if alignment == .right {
    print("We should right-align the text!")
}

alignment = .justify

// when possible avoid default in switch because default is not 'future proof'
switch alignment {
case .left:
    print("Left aligned!")
case .right:
    print("Right aligned!")
case .center:
    print("Center aligned!")
case .justify:
    print("Justified")
}

print("Left has raw value \(TextAlignment.left.rawValue)")
print("Right has raw value \(TextAlignment.right.rawValue)")
print("Center has raw value \(TextAlignment.center.rawValue)")
print("Justify has raw value \(TextAlignment.justify.rawValue)")

// creating an enum from a row value
var aRawValue = 20
if let newAlignment = TextAlignment(rawValue: aRawValue) {
    print("Successfully converted \(aRawValue) to TextAlignment.")
} else {
    print("\(aRawValue) has no corrisponding TextAlignment case")
}

// an enum with String as underlying type, if no value specified it will use the name of the case as value
enum ProgrammingLanguage: String {
    case swift
    case objectiveC =   "objective-c"
    case c
    case cpp        =   "c++"
    case java
}

let myFavoriteLanguage = ProgrammingLanguage.swift
print("My favorite programming language is \(myFavoriteLanguage.rawValue)")

// in swift an enum can have methods
// self is used to access the instance on which the method is called
enum Lightbulb {
    case on
    case off
    
    func surfaceTemperature(forAmbientTemperature ambient: Double) -> Double {
        switch self {
        case .on:
            return ambient + 150.0
        case .off:
            return ambient
        }
    }
    
    // a function cannot modify 'self' because enumerations are value types
    // for allwing a method to modify the instance we have to mark it as mutating
    mutating func toggle() {
        switch self {
        case .on:
            self = .off
        case .off:
            self = .on
        }
    }
}

var bulb = Lightbulb.on
let ambientTemperature = 77.0
var bulbTemperature = bulb.surfaceTemperature(forAmbientTemperature: ambientTemperature)
print("The bulb's temperature is \(bulbTemperature)")

bulb.toggle()

bulbTemperature = bulb.surfaceTemperature(forAmbientTemperature: ambientTemperature)
print("The bulb's temperature is \(bulbTemperature)")

// enumeration cases with associated values, basically this is a named tuple
enum ShapeDimensions {
    // not all cases needs to have associated values
    case point
    case square(side: Double)
    case rectangle(width: Double, height: Double)
    // Silver Challenge
    case rightTriangle(width: Double, height: Double, hypotenuse: Double)
    
    // use switch to unpack the associated values and use it
    func area() -> Double {
        switch self {
        case .point:
            return 0
        case let .square(side: side):
            return side * side
        case let .rectangle(width: w, height: h):
            return w * h
        case let .rightTriangle(width: w, height: h, hypotenuse: _):
            return 0.5 * w * h
        }
    }
    // Bronze Challenge
    func perimeter() -> Double {
        switch self {
        case .point:
            return 0
        case let .square(side: side):
            return side * 4
        case let .rectangle(width: w, height: h):
            return (w + h) * 2
        case let .rightTriangle(width: w, height: h, hypotenuse: hyp):
            return w + h + hyp
        }
    }
}

var squareShape = ShapeDimensions.square(side: 10.0)
var rectShape = ShapeDimensions.rectangle(width: 5.0, height: 10.0)
var pointShape = ShapeDimensions.point
var rightTriangleShape = ShapeDimensions.rightTriangle(width: 5.0, height: 10.0, hypotenuse: 15.0)

print("square's area = \(squareShape.area())")
print("rectangle's area = \(rectShape.area())")
print("point's area = \(pointShape.area())")
print("right triangle's area = \(rightTriangleShape.area())")

print("square's perimeter = \(squareShape.perimeter())")
print("rectangle's perimeter = \(rectShape.perimeter())")
print("point's perimeter = \(pointShape.perimeter())")
print("right triangle's perimeter = \(rightTriangleShape.perimeter())")

// recoursive enumeration needs to be marked as indirect
enum FamilyTree {
    case noKnownParents
    indirect case oneKnownParent(name: String, ancestors: FamilyTree)
    indirect case twoKnownParents(fatherName: String, fatherAncestors: FamilyTree, motherName: String, motherAncestors: FamilyTree)
}

let fredAncestors = FamilyTree.twoKnownParents(fatherName: "Fred Sr.",
                                               fatherAncestors: .oneKnownParent(name: "Beth", ancestors: .noKnownParents),
                                               motherName: "Masha", motherAncestors: .noKnownParents)