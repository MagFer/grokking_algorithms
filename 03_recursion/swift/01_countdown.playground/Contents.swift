import UIKit

func countdown(number: Int) {
    print("\(number)")
    // base case
    guard number > 0 else { return }
    // recurside case
    countdown(number: number - 1)
}

countdown(number: 5)
