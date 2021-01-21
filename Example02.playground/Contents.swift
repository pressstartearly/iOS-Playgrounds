import Cocoa

var str = "Hello, playground"

func f0()
{
    print("Have fun in CSC 308!")
}

f0()

// first parameter value is the external name, followed by the internal parameter name
func f1(message m: String, numberOfTimes n: Int)
{
    for _ in 1 ... n
    {
        print(m)
    }
}

f1(message: "Hello World!", numberOfTimes: 6)

// underscore means no external name
func f2(_ m: String, _ n: Int)
{
    for _ in 1 ... n
    {
        print(m)
    }
}

f2("Hello World!", 9)

// internal and external labels are the same here
func f3(message: String, numberOfTimes: Int)
{
    for _ in 1 ... numberOfTimes
    {
        print(message)
    }
}
f3(message: "Hello world!", numberOfTimes: 4)

/* default" in type parameters. We are not allowed to change their content
func f4(firstWord: String, secondWord: String)
{
    let w = firstWord
    firstWord = secondWord // ERROR!
    secondWord = w // ERROR!
}
 */

// Now we can modify their content
func f5(firstWord: inout String, secondWord: inout String)
{
    let w = firstWord
    firstWord = secondWord
    secondWord = w
}
var w1 = "CSC"
var w2 = "308"
f5(firstWord: &w1, secondWord: &w2)
print(w1 + w2)

func f6(numbers: [Int]) -> (mean: Double, median: Int, mode: Int)
{
    var sum = 0.0
    let sortedNumbers = numbers.sorted()
    var occurences = [Int: Int]()
    
    for n in numbers
    {
        sum += Double(n)
        if occurences[n] == nil{
            occurences[n] = 1
        }
        else
        {
            occurences[n]! += 1
        }
    }
    
    var highest: (key: Int, value: Int) = (0,0)
    
    for t in occurences
    {
        if t.value > highest.value
        {
            highest = t
        }
    }
    
    return (sum / Double(numbers.count), sortedNumbers[numbers.count / 2], highest.key)
}

let mmm = f6(numbers: [10,4,5,6,7,8,9,10,45,5,5,5])
print("\(mmm.mean) \(mmm.median) \(mmm.mode)")
print("\(mmm.0) \(mmm.1) \(mmm.2)") // You also can just index the location

// Return a refrence to a function

// All three function below have the same function type ([Int])->Double
func mean(numbers: [Int]) -> Double
{
    var sum = 0.0

    
    for n in numbers
    {
        sum += Double(n)
    
    }
    
    return sum / Double(numbers.count)
}

func median(numbers: [Int]) -> Double
{
    let sortedNumbers = numbers.sorted()
    
    return Double(sortedNumbers[numbers.count / 2])
}

func mode(numbers: [Int]) -> Double
{
    var occurences = [Int: Int]()
    
    for n in numbers
    {
        if occurences[n] == nil{
            occurences[n] = 1
        }
        else
        {
            occurences[n]! += 1
        }
    }
    
    var highest: (key: Int, value: Int) = (0,0)
    
    for t in occurences
    {
        if t.value > highest.value
        {
            highest = t
        }
    }
    
    return Double(highest.key)
}

func f7(funcCode: Int) -> ([Int])->Double
{
    switch funcCode
    {
    case 0:
        return mean
    case 1:
        return median
    default:
        return mode
    }
}
var g1 = f7(funcCode: 0)
print(g1([10,4,5,6,7,8,9,10,45,5,5,5]))
g1 = f7(funcCode: 1)
print(g1([10,4,5,6,7,8,9,10,45,5,5,5]))
g1 = f7(funcCode: 2)
print(g1([10,4,5,6,7,8,9,10,45,5,5,5]))

// Use a reference to a functiuon as an arguyment in the function call
func f8(numbers: [Int], usingFunction f: ([Int])->Double) -> Double
{
    return f(numbers)
}

print(f8(numbers: [10,4,5,6,7,8,9,10,45,5,5,5], usingFunction: mean))

