//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

@propertyWrapper struct Capitalized {
    var wrappedValue: String {
        didSet { wrappedValue = wrappedValue.capitalized }
    }

    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue.capitalized
    }
}

struct User {
    @Capitalized var firstName: String
    @Capitalized var lastName: String
}

// John Appleseed
var user = User(firstName: "john", lastName: "appleseed")
print("\(user.firstName)  \(user.lastName)")

// John Apple
user.lastName = "apple"
print("\(user.firstName)  \(user.lastName)")

@propertyWrapper struct AddOne {
    var wrappedValue: Int {
        didSet { wrappedValue = wrappedValue + 1 }
    }

    init(wrappedValue: Int) {
        self.wrappedValue = wrappedValue + 2
    }
}

struct AddOneNumber {
    @AddOne var myNum: Int
}
var theNum = AddOneNumber(myNum: 5/*"5"*/)
print(theNum.myNum)
theNum.myNum = 4

print(theNum.myNum)

//: [Next](@next)
