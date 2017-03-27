import Cocoa

let playground = "Hello, Playground"
var mutablePlayground = "Hello, mutable playground"
mutablePlayground += "!"

for c: Character in mutablePlayground.characters {
    print(c)
}

let oneCoolDude = "\u{1F60E}"
let aAcute = "\u{0061}\u{0301}"

for scalar in playground.unicodeScalars {
    print("\(scalar.value)", separator: " ", terminator: " ")
}

print()

let aAcutePrecomposed = "\u{00E1}"

let b = (aAcute == aAcutePrecomposed)

print("aAcute: \(aAcute.characters.count); aAcutePrecomposed: \(aAcutePrecomposed.characters.count)")

let startIndex = playground.startIndex
let end = playground.index(startIndex, offsetBy: 4)
let fifthCharacter = playground[end]

let range = startIndex...end
let firstFive = playground[range]

//  BRONZE CHALLENGE use startIndex and endIndex to determine if the String empty is empty
let empty = ""

if empty.startIndex == empty.endIndex {
    print("The string is empty")
}

if empty.isEmpty {
    print("The String is empty")
}

//  SILVER CHALLENGE replace the Hello String with an instance created out of its corresponding Unicode scalars
mutablePlayground.replaceSubrange(range, with: "\u{0048}\u{0065}\u{006C}\u{006C}\u{006F}")