import UIKit

func factorial(_ n: Int, total: Int = 0) -> Int {
    print("\(n) x \(total)")
    if n == 1 { return total }
    if total == 0 {
        return factorial(n-1, total: n * (n-1))
    }
    return factorial(n-1, total: total * (n-1))
}

measureTime("\nfactorial") {
    _ = factorial(5)
}
// 5 x 4 x 3 x 2 x 1 = 5! = 120
print("factorial: \(factorial(5))")

func factorialWhile(_ n: Int) -> Int {
    var arrayNumber = Array(1...n)
    var result = 1
    while !arrayNumber.isEmpty {
        result *= arrayNumber.removeLast()
    }
    return result
}

measureTime("\nfactorialWhile") {
    _ = factorialWhile(5)
}
// 5 x 4 x 3 x 2 x 1 = 5! = 120
print("factorialWhile: \(factorialWhile(5))")

func fac(_ n: Int) -> Int {
    if n == 1 { return 1 }
    return n * fac(n-1)
}

measureTime("\nfac") {
    _ = fac(5)
}
print("fac: \(fac(5))")


func measureTime(_ label: String, block: () -> Void) {
    let start = DispatchTime.now()
    block()
    let end = DispatchTime.now()

    let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
    let timeInMs = Double(nanoTime) / 1_000_000
    print("\(label): \(timeInMs) ms")
}


// 5 * 4 * 3 * 2 * 1

//func fac(5) -> Int {
//    return 5 * fac(4)
//}

//func fac(4) -> Int {
//    return 4 * fac(3)
//}

//func fac(3) -> Int {
//    return 3 * fac(2)
//}

//func fac(2) -> Int {
//    return 2 * fac(1)
//}

//func fac(1) -> Int {
//    return 1
//}

// Call stack
/*
 |      fac     |
 |  x   |   1   | = 1
 |  x   |   2   |
 |  x   |   3   |
 |  x   |   4   |
 |  x   |   5   |
*/
