import Foundation

func sumOfTheDigitsOfHarshadNumber(_ x: Int) -> Int {
    var sumOfDigits = 0

    if x/10 == 0 {
        return x
    }

    var res = x
    while res > 0 {
        let mod = res % 10
        sumOfDigits += mod
        res /= 10
    }

    if x/sumOfDigits > 0 && x%sumOfDigits == 0 {
        return sumOfDigits
    }

    return -1
}

