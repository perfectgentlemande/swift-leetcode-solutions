import Foundation

func minimumOperations(_ nums: [Int]) -> Int {
    var res = 0

    for n in nums {
        if (n+1)%3 == 0 {
            res += 1
            continue
        }

        if (n-1)%3 == 0 {
            res += 1
            continue
        }
    }

    return res
}

