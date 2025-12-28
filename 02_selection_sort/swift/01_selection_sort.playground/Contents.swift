import UIKit

let numbers: [Int] = [5, 3, 6, 2, 10]
print("numbers \(numbers)")

func findSmallestIndex(numbers: [Int]) -> Int? {
    guard numbers.count > 0 else { return nil }
    var smallestNumberIndex: Int = 0
    var smallestNumber: Int = numbers[0]
    guard numbers.count > 1 else { return smallestNumberIndex }
    
    for (index, number) in numbers.enumerated() {
        if number < smallestNumber {
            smallestNumber = number
            smallestNumberIndex = index
        }
    }
    return smallestNumberIndex
}

print("findSmallestIndex \(findSmallestIndex(numbers: numbers) ?? 0)")

func selectionSort(numbers: [Int]) -> [Int] {
    var numbersClone = numbers
    var numbersSorted = Array<Int>()
    for _ in 0..<numbers.count {
        if numbersClone.count == 1 {
            numbersSorted.append(numbersClone[0])
            numbersClone.remove(at: 0)
        }
        else if let smallestNumbersIndex = findSmallestIndex(numbers: numbersClone) {
            numbersSorted.append(numbersClone[smallestNumbersIndex])
            numbersClone.remove(at: smallestNumbersIndex)
        }
    }
    return numbersSorted
}

print("selectionSort \(selectionSort(numbers: numbers))")

