//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

func greet1(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}
print(greet1(person: "Bob", day: "Tuesday"))
//print(greet1(day: "Monday", person: "ash"))

func greet2(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}
print(greet2("John", on:"Wednesday"))

func greet3(_ person: String,_ day: String, _ sday:String) -> String {
    "Hello \(person), today is \(day), or maybe \(sday)."
}
print(greet3("John", "Wednesday", "Sunday"))

// a function is just a type
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)


// The code in a closure has access to things like variables and functions that were available
// in the scope where the closure was created, even if the closure is in a different scope when it is executed
var numbers = [20, 19, 7, 12]
let ans = numbers.map({ (number: Int) -> Int in
    let result = 5 * number
    return result
})
print(ans)

// escaping closure
var closureArr:[()->()] = [/*empty of void->void closures*/]

func testFunctionWithEscapingClosure(myClosure:@escaping() -> Void) {
    print("function called")
    closureArr.append(myClosure)
    // myClosure() none escaping
}

testFunctionWithEscapingClosure(myClosure: {print("closure called")})
closureArr[0]()

// shorting the name
let names = ["ash","bob"]
var reversedNames:[String] = []
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2 } ) // we know names is a String
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } ) // must return a Bool
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } ) // remove return
reversedNames = names.sorted(by: { $0 > $1 } ) // use $#
reversedNames = names.sorted(by: >) // because sort takes two args and > uses them we can remove them

// trainling closure -- Kotlin also does this
func someFunctionThatTakesAClosure(closure: () -> Void) {
    // function body goes here
}
someFunctionThatTakesAClosure(closure: {
    // closure's body goes here
})
someFunctionThatTakesAClosure() {
    // trailing closure's body goes here
}
testFunctionWithEscapingClosure {
    print("closure called")
}

// Swift 5.1 features
struct ContentViewHW: View {
    @State var showPrint:Bool // property wrapper
    var body: some View { // opaque return type
        VStake {          // Trailing Closure
            Text("Hello World")
        }
        // Omit return type of View
    }
}

//: [Next](@next)
