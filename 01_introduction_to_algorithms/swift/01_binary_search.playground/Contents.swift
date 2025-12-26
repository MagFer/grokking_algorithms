import UIKit

func binarySearchBruteForce<T: Comparable>(_ array: [T], _ key: T) -> Int? {
    for index in 0...array.count - 1 {
        if array[index] == key {
            print("binarySearchBruteForce Index found: \(index)")
            return index
        }
    }
    return nil
}

func binarySearch<T: Comparable>(_ array: [T], _ key: T) -> Int? {
    var lowIndex = 0
    var hightIndex = array.count - 1
    var arrayToEvaluate = array
    
    while hightIndex >= lowIndex {
        let midIndex = (hightIndex - lowIndex)/2
        if arrayToEvaluate[midIndex] == key {
            print("binarySearch found: \(midIndex)")
            return midIndex
        } else if arrayToEvaluate[midIndex] > key {
            hightIndex = midIndex - 1
            arrayToEvaluate = Array(arrayToEvaluate[lowIndex...hightIndex])
            print("New arrayToEvaluate: \(arrayToEvaluate)")
        } else if array[midIndex] < key {
            lowIndex = midIndex + 1
            arrayToEvaluate = Array(arrayToEvaluate[lowIndex...hightIndex])
            print("New arrayToEvaluate: \(arrayToEvaluate)")
        }
    }
    return nil
}

func measureTime(_ label: String, block: () -> Void) {
    let start = DispatchTime.now()
    block()
    let end = DispatchTime.now()

    let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
    let timeInMs = Double(nanoTime) / 1_000_000
    print("\(label): \(timeInMs) ms")
}


let numericArray = [1, 2, 3, 4, 6, 10, 19, 100, 120, 230, 1001]
measureTime("binarySearchBruteForce") {
    let keyIndexBruteForce = binarySearchBruteForce(numericArray, 10)
}
measureTime("binarySearch") {
    let keyIndex = binarySearch(numericArray, 10)
}


