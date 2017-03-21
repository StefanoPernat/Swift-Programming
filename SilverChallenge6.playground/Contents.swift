import Cocoa

for i in 1...100 {
    let divisionResult = (byThree: i % 3, byFive: i % 5)
    switch divisionResult {
    case (0, 0):
        print("FIZZ BUZZ")
    case (0, _):
        print("FIZZ")
    case (_, 0):
        print("BUZZ")
    default:
        print(i)
    }
}