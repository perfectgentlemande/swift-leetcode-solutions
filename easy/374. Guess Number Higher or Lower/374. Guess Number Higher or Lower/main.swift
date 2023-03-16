import Foundation

func guessNumber(_ n: Int) -> Int {
    var left = 1
    var right = n

    while left <= n {
        let mid = left + (right-left)/2

        let res = guess(mid)
        if res == 0 {
            return mid
        }

        if res < 0 {
            right = mid - 1
            continue
        }

        left = mid + 1
    }

    return 0
}

