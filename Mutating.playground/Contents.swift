import Cocoa

func greet(name: String, withGreeting greeting: String) -> String {
    return "\(greeting) \(name)"
}

let personalGreeting = greet(name: "Stefano", withGreeting: "Hello,")
print(personalGreeting)

func greeting(_ greeting: String) -> (String) -> String {
    return { (name: String) -> String in
        return "\(greeting) \(name)"
    }
}

let friendlyGreetingFor = greeting("Hello,")
let mattGreeting = friendlyGreetingFor("Matt")
print(mattGreeting)

struct Person {
    var firstName = "Stefano"
    var lastName = "Pernat"
    
    mutating func changeTo(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

var p = Person()
let changeName = Person.changeTo
let changeFromMattTo = changeName(&p)
changeFromMattTo("Claudia", "Chiesa")
print(p)