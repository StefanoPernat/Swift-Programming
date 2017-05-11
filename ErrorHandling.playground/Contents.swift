import Cocoa

enum Token {
    case number(Int)
    case plus
    // Bronze Challenge
    case minus
}

class Lexer {
    enum Error: Swift.Error {
        case invalidCharacter(Character, Int)
    }
    
    let input: String.CharacterView
    var position: String.CharacterView.Index
    
    init(input: String) {
        self.input = input.characters
        self.position = self.input.startIndex
    }
    
    func peek() -> Character? {
        guard position < input.endIndex else {
            return nil
        }
        
        return input[position]
    }
    
    func advance() {
        assert(position < input.endIndex, "Cannot advance past endIndex!")
        position = input.index(after: position)
    }
    
    func getNumber() -> Int {
        var value = 0
        
        while let nextCharacter = peek() {
            switch nextCharacter {
            case "0"..."9":
                let digitValue = Int(String(nextCharacter))!
                value = 10 * value + digitValue
                advance()
            default:
                return value
            }
        }
        
        return value
    }
    
    func lex() throws -> [Token] {
        var tokens = [Token]()
        
        while let nextCharacter = peek() {
            switch nextCharacter {
            case "0"..."9":
                let value = getNumber()
                tokens.append(.number(value))
            case "+":
                tokens.append(.plus)
                advance()
            case "-":
                tokens.append(.minus)
                advance()
            case " ":
                advance()
            default:
                throw Lexer.Error.invalidCharacter(nextCharacter, input.distance(from: input.startIndex, to: position))
            }
        }
        
        return tokens
    }
}

class Parser {
    let tokens: [Token]
    var position = 0
    
    enum Error: Swift.Error {
        case unexpectedEndOfInput
        case invalidToken(Token, Int)
    }
    
    init(tokens: [Token]) {
        self.tokens = tokens
    }
    
    func getNextToken() -> Token? {
        guard position < tokens.count else {
            return nil
        }
        
        let token = tokens[position]
        position += 1
        return token
    }
    
    func getNumber() throws -> Int {
        guard let token = getNextToken() else {
            throw Parser.Error.unexpectedEndOfInput
        }
        
        switch token {
        case .number(let value):
            return value
        case .plus, .minus:
            throw Parser.Error.invalidToken(token, position-1)
        }
    }
    
    func parse() throws -> Int {
        var value = try getNumber()
        
        while let token = getNextToken() {
            switch token {
            case .plus:
                let nextNumber = try getNumber()
                value += nextNumber
            case .minus:
                let nextNumber = try getNumber()
                value -= nextNumber
            case .number:
                throw Parser.Error.invalidToken(token, position-1)
            }
        }
        
        return value
    }
}

func evaluate(_ input: String) {
    print("Evaluating: \(input)")
    let lexer = Lexer(input: input)
    do {
        let tokens = try lexer.lex()
        print("Lexer output \(tokens)")
        
        let parser = Parser(tokens: tokens)
        let result = try parser.parse()
        print("Parser output: \(result)")
    } catch Lexer.Error.invalidCharacter(let character, let position) {
        print("Input contained an invalid character at index \(position): \(character)")
    } catch Parser.Error.unexpectedEndOfInput {
        print("Unexpected end of input during parsing")
    } catch Parser.Error.invalidToken(let token, let position) {
        print("Invalid token during parsing at index \(position): \(token)")
    } catch {
        print("an error occurred: \(error)")
    }
}

evaluate("10 + 3 3 + 7")
