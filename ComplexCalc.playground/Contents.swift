print("Welcome back to the UW Calculator")

// Your job is to fill out Calculator so all the expressions
// below both compile and return "true"
class Calculator {
    
    // `add` functions
    
    // takes two integer values lhs and rhs
    // returns an integer that is the sum of the given integers
    func add(lhs: Int, rhs: Int) -> Int {
        return lhs + rhs
    }
    
    // takes an array of integers
    // returns an integer that is the sum of the given integers
    func add(_ arrayInts: [Int]) -> Int {
        var sum = 0
        for val in arrayInts {
            sum += val
        }
        return sum
    }
    
    // takes two tuples lhs and rhs that each tuple contains two integer values
    // returns a tuple that is the sum (element-wise) of the given tuples
    func add(lhs: (Int, Int), rhs: (Int, Int)) -> (Int, Int) {
        let firstElem = lhs.0 + rhs.0
        let secondElem = lhs.1 + rhs.1
        return (firstElem, secondElem)
    }
    
    // takes two dictionaries from string mapping to integer which represent two 2D points
    // returns a directionary reprsents the (vector) sum of the given points
    func add(lhs: [String: Int], rhs: [String: Int]) -> [String: Int] {
        let x = lhs["x"]! + rhs["x"]!
        let y = lhs["y"]! + rhs["y"]!
        return ["x": x, "y": y]
    }
    
    // `subtract` functions
    
    // takes two integer values
    // returns their difference (the first value subtracts the second value)
    func subtract(lhs: Int, rhs: Int) -> Int {
        return lhs - rhs
    }
    
    // takes two tuples representing two 2D points
    // returns the (vector) difference of the two given points
    func subtract(lhs: (Int, Int), rhs: (Int, Int)) -> (Int, Int) {
        let firstElem = lhs.0 - rhs.0
        let secondElem = lhs.1 - rhs.1
        return (firstElem, secondElem)
    }
    
    // takes two dictionaries representing two 2D points
    // return the (vector) difference of the two given points
    func subtract(lhs: [String: Int], rhs: [String: Int]) -> [String: Int] {
        let x = lhs["x"]! - rhs["x"]!
        let y = lhs["y"]! - rhs["y"]!
        return ["x": x, "y": y]
    }
    
    // `multiply` functions
    
    // takes two integer values
    // returns the product of the given integers
    func multiply(lhs: Int, rhs: Int) -> Int {
        return lhs * rhs
    }
    
    // takes an array of integers
    // returns the product of the given integers
    func multiply(_ arrayInts: [Int]) -> Int {
        var product = 1
        for val in arrayInts {
            product *= val
        }
        return product
    }
    
    // `divide` function
    
    // takes two integer values as parameters
    // returns the integer result of first integer divided by second integer
    // assumes the first integer is divisible by the second integer and the second integer is NOT 0
    func divide(lhs: Int, rhs: Int) -> Int {
        return lhs / rhs
    }
    
    // `count` function
    
    // takes an array of integers and returns the number of integers in the given array
    func count(_ arrayInts: [Int]) -> Int {
        return arrayInts.count
    }
    
    // `avg` function
    
    // takes an array of integers and returns the average of the given integers
    // assumes the average value of the given integers is an integer
    // assumes the given array is not empty
    func avg(_ arrayInts: [Int]) -> Int {
        let sum = add(arrayInts)
        return sum / arrayInts.count
    }
    
    // `mathOp` functions
    
    // takes two integers lhs and rhs and an anonymous function which defines a mathematical
    // operations to perform on the two given integers
    // returns an integer that is the result calculated by the given function
    func mathOp(lhs: Int, rhs: Int, op: (Int, Int) -> Int) -> Int {
        return op(lhs, rhs)
    }
    
    // takes an array of integers, an integer beg, and an anonymous function
    // the given function defines a mathematical operation, the given integer beg defines
    // the value to begin with, and the integer array gives the rest values to continue on
    // in later operations
    // (see detailed examples in the testing section below)
    func mathOp(args: [Int], beg: Int, op: (Int, Int) -> Int) -> Int {
        var lhs = beg
        for val in args {
            lhs = op(lhs, val)
        }
        // when exit the loop above, the lhs value is also the final result
        return lhs
    }
}

let calc = Calculator()  // Don't change this declaration name; it's used in all the tests below

// ====> Add your own tests here if you wish <====


// ====> Do not modify code in this section <====
calc.add(lhs: 2, rhs: 2) == 4
calc.subtract(lhs: 2, rhs: 2) == 0
calc.multiply(lhs: 2, rhs: 2) == 4
calc.divide(lhs: 2, rhs: 2) == 1

calc.mathOp(lhs: 5, rhs: 5, op: { (lhs: Int, rhs: Int) -> Int in (lhs + rhs) + (lhs * rhs) }) == 35
    // This style is one way of writing an anonymous function
calc.mathOp(lhs: 10, rhs: -5, op: { ($0 + $1) + ($0 - $1) }) == 20
    // This is the second, more terse, style; either works

calc.add([1, 2, 3, 4, 5]) == 15
calc.multiply([1, 2, 3, 4, 5]) == 120
calc.count([1, 2, 3, 4, 5, 6, 7, 8]) == 8
calc.count([]) == 0
calc.avg([2, 2, 2, 2, 2, 2]) == 2
calc.avg([1, 2, 3, 4, 5]) == 3
calc.avg([1]) == 1

calc.mathOp(args: [1, 2, 3], beg: 0, op: { $0 + $1 }) == 6
    // this is (((0 op 1) op 2) op 3)
calc.mathOp(args: [1, 2, 3, 4, 5], beg: 0, op: { $0 + $1 }) == 15
    // this is (((((0 op 1) op 2) op 3) op 4) op 5)
calc.mathOp(args: [1, 1, 1, 1, 1], beg: 1, op: { $0 * $1 }) == 1
    // this is (((((1 op 1) op 1) op 1) op 1) op 1)

let p1 = (5, 5)
let p2 = (12, -27)
let p3 = (-4, 4)
let p4 = (0, 0)
calc.add(lhs: p1, rhs: p2) == (17, -22)
calc.subtract(lhs: p1, rhs: p2) == (-7, 32)
calc.add(lhs: p4, rhs: p4) == (0, 0)
calc.add(lhs: p3, rhs: p4) == (-4, 4)

let pd1 = ["x": 5, "y": 5]
let pd2 = ["x": -4, "y": 4]
calc.add(lhs: pd1, rhs: pd2) == ["x": 1, "y": 9]
calc.subtract(lhs: pd1, rhs: pd2) == ["x": 9, "y": 1]
