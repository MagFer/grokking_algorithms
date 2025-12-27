import UIKit

func linealSearch<T: Comparable>(_ array: [T], _ key: T) -> Int? {
    for index in 0...array.count - 1 {
        if array[index] == key {
            print("linealSearch Index found: \(index)")
            return index
        }
    }
    return nil
}

func binarySearch(_ array: [Int], _ key: Int) -> Int? {
    var lowIndex = 0
    var hightIndex = array.count - 1
    
    while hightIndex >= lowIndex {
        let midIndex = lowIndex + (hightIndex - lowIndex)/2
        let arrayNumGuess = array[midIndex]
        
        if arrayNumGuess == key {
            print("binarySearch found: \(midIndex)")
            return midIndex
        } else if arrayNumGuess > key {
            hightIndex = midIndex - 1
            print("New arrayToEvaluate: \(array[lowIndex...hightIndex])")
        } else if arrayNumGuess < key {
            lowIndex = midIndex + 1
            print("New arrayToEvaluate: \(array[lowIndex...hightIndex])")
        }
    }
    return nil
}

func binarySearchRecursive(_ array: [Int], _ key: Int, lowIndex: Int, hightIndex: Int) -> Int? {
    print("New binarySearchRecursive arrayToEvaluate: \(array[lowIndex...hightIndex])")
    
    if hightIndex >= lowIndex {
        let midIndex = lowIndex + (hightIndex - lowIndex)/2
        if array[midIndex] == key {
            print("binarySearchRecursive found: \(midIndex)")
            return midIndex
        } else if array[midIndex] > key {
            binarySearchRecursive(array, key, lowIndex: lowIndex, hightIndex: midIndex - 1)
        } else if array[midIndex] < key {
            binarySearchRecursive(array, key, lowIndex: midIndex + 1, hightIndex: hightIndex)
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


let numericArray = [1, 2, 3, 4, 6, 10, 19, 100, 120, 230, 1001, 2000, 2011, 2020]
measureTime("binarySearchBruteForce") {
    let keyIndexBruteForce = linealSearch(numericArray, 120)
}
measureTime("binarySearch") {
    let keyIndex = binarySearch(numericArray, 120)
}
measureTime("binarySearch") {
    let keyIndex = binarySearchRecursive(
        numericArray,
        120,
        lowIndex: 0,
        hightIndex: numericArray.count-1
    )
}
