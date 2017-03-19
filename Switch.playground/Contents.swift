import Cocoa

var statusCode: Int = 418
var errorString: String = "The request failed with the error: "


//  default switch statement
/*
switch statusCode {
case 404:
    errorString = "Bad request"
case 401:
    errorString = "Unauthorized"
case 403:
    errorString = "Forbidden"
case 404:
    errorString = "Not found"
default:
    errorString = "None"
}

//  switch statemet forced to fallthrough
switch statusCode {
case 400, 401, 403, 404:
    errorString = "There was something wrong with the request."
    fallthrough
default:
    errorString += " Please review the request and try again."
}

print(errorString)
 */

//  Switch with ranges and value binding
switch statusCode {
case 100, 101:
    errorString += " Informational, \(statusCode)."
case 204:
    errorString += " Successful but no content, \(statusCode)."
case 300...307:
    errorString += " Redirection, \(statusCode)."
case 400...417:
    errorString += " Client error, \(statusCode)."
case 500...505:
    errorString += " Server error, \(statusCode)."
case let unknownCode where (unknownCode >= 200 && unknownCode < 300) || unknownCode > 505:
    errorString = "\(statusCode) is not a known error code."
default:
    errorString = "Unexpected error encountered."
}

//  Defining a tuple
let error = (code: statusCode, error: errorString)
error.code
error.error

//  pattern matching with tuples
let firstErrorCode = 404
let secondErrorCOde = 200
let errorCodes = (firstErrorCode, secondErrorCOde)

switch errorCodes {
case (404, 404):
    print("No items found.")
case (404, _):
    print("First item not found.")
case (_, 404):
    print("Second item not found.")
default:
    print("All items found.")
}

let age = 25
switch age {
case 18...35:
    print("Cool demographic old")
default:
    break
}

//  if-case statement
if case 18...35 = age, age >= 21, age < 30 {
    print("Cool demographic, of drinking age and not in the thirties.")
}

//  THE BRONZE CHALLENGE PRINTS
//      (1, 4) is in quadrant 1