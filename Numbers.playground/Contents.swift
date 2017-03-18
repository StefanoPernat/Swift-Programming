import Cocoa

print("The maximum Int value is \(Int.max)")
print("The minimum Int value is \(Int.min)")

print("The maximum value for a 32-bit integer is \(Int32.max)")
print("The minimum value for a 32-bit integer is \(Int32.min)")

print("The maximum UInt value is \(UInt.max)")
print("The minimum UInt value is \(UInt.min)")

print("The maximum value for a 32-bit unsigned integer is \(UInt32.max)")
print("The minimum value for a 32-bit unsigned integer is \(UInt32.min)")

let numberOfPages: Int = 10     //  Constant declared explicitly as Int
let numbersOfChapters = 3       //  Constant declared implicitly and inferred by the compiler to be int

let numberOfPeople: UInt = 40
let volumeAdjustment: Int32 = -1000

print(10 + 20)
print(30 - 5)
print(5 * 6)

print(10 + 2 * 5)
print(30 - 5 - 5)

print((10 + 2) * 5)
print(30 - (5 - 5))

print(11 / 3)               //  it prints 3 because is a division between Integers so no reminder, the result is an Integer
print(11 % 3)               //  the reminder operator gives the reminder as result
print(-11 % 3)              //  the reminder operator is wrong on negative numbers


//  Shorthand operator
var x = 10
x += 10
print("x has had 10 added to it and is now \(x)")
x -= 5
print("x has had 5 subtracted from it and is now \(x)")

//  Overflow operator
let w: Int8 = -120
let y: Int8 = 120
//let z = y + 10                  //    z is inferred to be Int8 too but Int8 can store up to 127 not 130 so error to let z overflow without hitting
                                  //    a trap we have to use overflow operators
let z = y &+ 10
print("120 &+ 10 is \(z)")
print("-120 &- 10 is \(w &- 10)")

//  Conversion between types
let a: Int16    = 200
let b: Int8     = 50

//let c = a + b error because Swift not automatically cast
let c = a + Int16(b)

//  Floating Point Numbers

let d1 = 1.1            //  Implicitly double, because inferred by the compiler
let d2: Double = 1.1    //  Explicitly double
let f1: Float = 100.3   //  Explicitly float

print(10.0 + 11.4)
print(11.0 / 0.3)

if d1 == d2 {
    print("d1 and d2 are the same")
}

print("d1 + 0.1 is \(d1 + 0.1)")
if d1 + 0.1 == 1.2 {
    print("d1 + 0.1 is equal to 1.2")
}
