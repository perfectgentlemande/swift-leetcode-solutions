import Foundation

func max(_ a: Int, _ b: Int) -> Int {
    if a >= b {
        return a
    }

    return b
}

func arrangeCoins(_ n: Int) -> Int {
    var l = 1
    var r = n
    var res = 0

    while l <= r {
        let mid = l + (r-l)/2
        let sum = (mid * (mid + 1)) / 2

        if sum > n {
            r = mid - 1
        } else {
            l = mid + 1
            res = max(res, mid)
        }
    }

    return res
}
