import Foundation

func extractReversedDigits(_ x: Int) -> [Int] {
    var res = [Int]()
    var n = x

    while n > 0 {
        res.append(n%10)
        n = n / 10
    }

    return res
}

func sumSquareDigits(_ ds: [Int]) -> Int {
    var res = 0

    for num in ds {
        res += num * num
    }

    return res
}

func isHappy(_ n: Int) -> Bool {
    var visited = Set<Int>()
    var temp = n

    while true {
        var sum = sumSquareDigits(extractReversedDigits(temp))
        if sum == 1 {
            return true
        }
        if visited.contains(sum) {
            return false
        }
        visited.insert(sum)

        temp = sum
    }
}

print(isHappy(19))
print(isHappy(2))
