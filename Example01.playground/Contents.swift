import UIKit

var str = "Hello, playground"

var cprefix = "CSC"
var cnumber = 308
var greeting = "Welcome to \(cprefix)\(cnumber)"
print(greeting)

var s = String(87)  // int to string
var d = Double(s)   // string to double
var i = Int(s)      // string to int
i = Int(87.7)       // Just ignores after the decimal

// optionals
var n: Int?         // Can be int or nil
print(n)
n = 123
print(n!)

n = Int("A")        // will be nil
print(n)
n = Int("521")      // will be valid
print(n!)
if n != nil
{
    print(n!)
}
else
{
    print("Invalid value was provided!!")
}

for i in 1...10 //includes 10
{
    print("for loop: \(i)-th iteration")
}

for i in 1..<10 //excludes 10
{
    print("for loop: \(i)-th iteration")
}

for i in stride(from: 0, to: 10, by: 2) //excludes 10
{
    print("for loop: \(i)-th iteration")
}

for i in stride(from: 0, through: 10, by: 2) //includes 10
{
    print("for loop: \(i)-th iteration")
}

var k = 0
while k<=10
{
    print("while loop: \(k)-th iteration")
    k += 2
}

var a = [Int]()
a = [6, 2, 8, 4]
var a2 = [6, 2, 8, 4] // same thing as the last two lines
a.sort()
for e in a
{
    print(e)
}

// Dictionaries
var cg = [String: Double]()
cg = ["CSC308": 86.5, "CSC310": 92, "CSC313": 87.0]
print(cg["CSC310"]!)
cg["CSC340"] = 95

for (k, v) in cg
{
    print("Key: \(k)     Value: \(v)")
}

let r = arc4random_uniform(101)     // between 0 -> 100
print(r)
switch r
{
case 80 ... 100:
    print("A or B")
    fallthrough // Use this to not immedietily jump out after successful case
case 60 ... 69, 70 ... 80:
    print("C or D")
default:
    print("F. You FAILED! You get NOTHING! GOOD DAY SIR!")
}
