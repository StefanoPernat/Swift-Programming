import Cocoa

protocol TabularDataSource {
    var numberOfRows: Int { get }
    var numberOfColumns: Int { get }
    
    func label(forColumn column: Int) -> String
    func itemFor(row: Int, column: Int) -> String
}

//protocol PrintableTableDataSource: TabularDataSource,

func customPrintTable(_ dataSource: TabularDataSource & CustomStringConvertible) {
    print("Table: \(dataSource.description)")
    var firstRow = "|"
    
    var columnWiths = [Int]()
    
    for i in 0 ..< dataSource.numberOfColumns {
        let columnLabel = dataSource.label(forColumn: i)
        let columnHeader = " \(columnLabel) |"
        firstRow += columnHeader
        columnWiths.append(columnLabel.characters.count)
    }
    
    print(firstRow)
    
    for i in 0 ..< dataSource.numberOfRows {
        var out = "|"
        
        for j in 0 ..< dataSource.numberOfColumns {
            let item = dataSource.itemFor(row: i, column: j)
            let paddingNeeded = columnWiths[j] - item.characters.count
            let padding = repeatElement(" ", count: paddingNeeded).joined(separator: "")
            out += " \(padding)\(item) |"
        }
        
        print(out)
    }
}

// Silver Challenge
func printTable(_ dataSource: TabularDataSource & CustomStringConvertible) {
    var columnWiths = [Int]()
    var firstRow = "|"
    
    for c in 0 ..< dataSource.numberOfColumns {
        var singleColumnWiths = (0 ..< dataSource.numberOfRows).map({dataSource.itemFor(row: $0, column: c).characters.count})
        let columnLabel = dataSource.label(forColumn: c)
        singleColumnWiths.append(columnLabel.characters.count)
        
        columnWiths.append(singleColumnWiths.max() ?? 0)
        let padding = repeatElement(" ", count: columnWiths[c] - columnLabel.characters.count).joined(separator: "")
        firstRow += " \(padding)\(columnLabel) |"
        
    }
    
    print(firstRow)
    
    for r in 0 ..< dataSource.numberOfRows {
        var out = "|"
        
        for c in 0 ..< dataSource.numberOfColumns {
            let item = dataSource.itemFor(row: r, column: c)
            //print("\(columnWiths[c]);\(item.characters.count)")
            let padding = repeatElement(" ", count: (columnWiths[c] - item.characters.count)).joined(separator: "")
            out += " \(padding)\(item) |"
            
        }
        
        print(out)
    }
}

let data = [
    ["Joe", "30", "6"],
    ["Karen", "40", "18"],
    ["Fred", "50", "20"]
]

struct Person {
    let name: String
    let age: Int
    let yearsOfExperience: Int
}

struct Department: TabularDataSource, CustomStringConvertible {
    let name: String
    var people = [Person]()
    
    var numberOfRows: Int {
        return people.count
    }
    
    var numberOfColumns: Int {
        return 3
    }
    
    var description: String {
        return "Department (\(name))"
    }

    init(name: String) {
        self.name = name
    }
    
    mutating func add(_ person: Person) {
        people.append(person)
    }
    
    func label(forColumn column: Int) -> String {
        switch column {
        case 0: return "Employee Name"
        case 1: return "Age"
        case 2: return "Years of Experience"
        default: fatalError("Invalid column!")
        }
    }
    
    func itemFor(row: Int, column: Int) -> String {
        let person = people[row]
        switch column {
        case 0: return person.name
        case 1: return String(person.age)
        case 2: return String(person.yearsOfExperience)
        default: fatalError("Invalid column!")
        }
    }
}

var department = Department(name: "Engineering")
department.add(Person(name: "Joe", age: 30, yearsOfExperience: 6))
department.add(Person(name: "Karen", age: 40, yearsOfExperience: 18))
department.add(Person(name: "Fred", age: 50, yearsOfExperience: 20))

print()
printTable(department)

// Gold Challenge
struct Book {
    let title: String
    let author: String
    let reviewsAverage: Double
}

struct BookCollection: TabularDataSource, CustomStringConvertible {
    let name: String
    var books = [Book]()
    
    var numberOfRows: Int {
        return books.count
    }
    
    var numberOfColumns: Int {
        return 3
    }
    
    var description: String {
        return "\(name) books"
    }
    
    init(name: String) {
        self.name = name
    }
    
    func label(forColumn column: Int) -> String {
        switch column {
        case 0: return "Title"
        case 1: return "Authors"
        case 2: return "Average reviews"
        default: fatalError("Invalid column!")
        }
    }
    
    func itemFor(row: Int, column: Int) -> String {
        let book = books[row]
        switch column {
        case 0: return book.title
        case 1: return book.author
        case 2: return String(book.reviewsAverage)
        default: fatalError("Invalid column!")
        }
    }
    
    mutating func add(_ book: Book) {
        books.append(book)
    }
}

var myBooks = BookCollection(name: "Stefano")
myBooks.add(Book(title: "Swift Programming: The Big Nerd Ranch Guide (2nd Edition)", author: "Matthew Mathias & John Gallagher", reviewsAverage: 5.5))
myBooks.add(Book(title: "iOS Programming: The Big Nerd Ranch Guide (6th Edition)", author: "Christian Keur & Aaron Hillegass", reviewsAverage: 5.0))
myBooks.add(Book(title: "The Go Programming Language", author: "Alan A. A. Donovan & Brian W. Kernighan", reviewsAverage: 4.5))

printTable(myBooks)
