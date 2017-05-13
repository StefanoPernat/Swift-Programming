import Cocoa

struct StackIterator<T>: IteratorProtocol {
    
    var stack: Stack<T>
    
    mutating func next() -> T? {
        return stack.pop()
    }
}

struct Stack<Element>: Sequence {
    var items = [Element]()
    
    mutating func push(_ newItem: Element) {
        items.append(newItem)
    }
    
     mutating func pop() -> Element? {
        guard !items.isEmpty else {
            return nil
        }
        
        return items.removeLast()
    }
    
    mutating func pushAll<S: Sequence>(_ sequence: S) where S.Iterator.Element == Element {
        for item in sequence {
            self.push(item)
        }
    }
    
    func map<U>(_ f: (Element) -> U) -> Stack<U> {
        var mappedItems = [U]()
        
        for item in items {
            mappedItems.append(f(item))
        }
        
        return Stack<U>(items: mappedItems)
    }
    
    // Bronze Challenge
    func filter(_ f: (Element) -> Bool) -> Stack<Element> {
        var filteredItems = [Element]()
        
        for item in items {
            if f(item) {
                filteredItems.append(item)
            }
        }
        
        return Stack(items: filteredItems)
    }
    
    func makeIterator() -> StackIterator<Element> {
        return StackIterator(stack: self)
    }
}

var intStack = Stack<Int>()
intStack.push(1)
intStack.push(2)
var doubledStack = intStack.map { $0 * 2 }

print(intStack.pop())
print(intStack.pop())
print(intStack.pop())


print(doubledStack.pop())
print(doubledStack.pop())

var stringStack = Stack<String>()
stringStack.push("This is a String")
stringStack.push("Another String")

print(stringStack.pop())

func myMap<T,U>(_ items: [T], _ f: (T) -> U) -> [U] {
    var result = [U]()
    
    for item in items {
        result.append(f(item))
    }
    
    return result
}

let strings = ["one", "two", "three"]
let stringsLengths = myMap(strings) { $0.characters.count }
print(stringsLengths)

func checkIfEqual<T: Equatable>(_ first: T, _ second: T) -> Bool {
    return first == second
}

print(checkIfEqual(1, 1))
print(checkIfEqual("a string", "a string"))
print(checkIfEqual("a string", "a different string"))

func checkIfDescriptionMatch<T: CustomStringConvertible, U: CustomStringConvertible>(_ first: T, _ second: U) -> Bool {
    return first.description == second.description
}

print(checkIfDescriptionMatch(Int(1), UInt(1)))
print(checkIfDescriptionMatch(1, 1.0))
print(checkIfDescriptionMatch(Float(1.0), Double(1.0)))

var myStack = Stack<Int>()
myStack.push(10)
myStack.push(20)
myStack.push(30)

var myStackIterator = StackIterator(stack: myStack)
while let value = myStackIterator.next() {
    print("Got \(value)")
}

var myOtherStack = Stack<Int>()
myOtherStack.pushAll([1,2,3])
myStack.pushAll(myOtherStack)
for value in myStack {
    print("for-in loop: got \(value)")
}

var filteredStack = myOtherStack.filter { $0 % 2 == 0 }
for item in filteredStack {
    print("\(item)")
}

// Silver Challenge && Gold Challenge
func findAll<T: Equatable, C: CollectionType where C.Generator.Element == T>(_ collection: C, _ item: T) -> [C.Index] {
    return collection.indices.filter({ collection[$0] == item })
}