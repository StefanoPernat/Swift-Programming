import Cocoa

var errorCodeString: String?  // String Optional
errorCodeString = "404"

if errorCodeString != nil {             //  first way to unwrap an optional
    let theError = errorCodeString!
    print(theError)
}

if let theError = errorCodeString {     //  optional binding, unwrap the optional and made available the value inside the if
    print(theError)
}


if let theError = errorCodeString {
    if let errorCodeInteger = Int(theError) {
        print("\(theError): \(errorCodeInteger)")
    }
}

if let theError = errorCodeString, let errorCodeInteger = Int(theError), errorCodeInteger == 404 {  // multiple optional binding and additional check
    print("\(theError): \(errorCodeInteger)")
}

var errorCodeString2: String!   //  implicitly unwrapped optional, use it when you are sure that it has a value, dangerous because if you try to access
errorCodeString2 = "404"        //  an implicitly unwrapped optional when is nil Swift will hit a trap
print(errorCodeString2)

//var errorCodeString3: String! = nil
//let anotherErrorCodeString: String = errorCodeString3       // trap
//let yetAnotherErrorCodeString = errorCodeString3

var errorDescription: String?
if let theError = errorCodeString, let errorCodeInteger = Int(theError), errorCodeInteger == 404 {  // multiple optional binding and additional check
    print("\(theError): \(errorCodeInteger)")
    //errorDescription = "\(errorCodeInteger + 200): resource was not found."
}

var upCaseErrorDescription = errorDescription?.uppercased() //  optional chaining, if errorDescription is not nil and then go on with the chain and execute uppercased else return nil
upCaseErrorDescription?.append(" PLEASE TRY AGAIN")
upCaseErrorDescription

//  old way if errorDesctiption is nil to provide a default value
//let description: String
//if let errorDescription = errorDescription {
//    description = errorDescription
//} else {
//    description = "No error"
//}

let description = errorDescription ?? "No error"    //  Nil Coalescing operator if errorDescription is nil provide a default value