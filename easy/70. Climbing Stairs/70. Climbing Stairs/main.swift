import Foundation


var climbResults = [Int: Int]()

func climbStairs(_ n: Int) -> Int {
    if n == 0 {
            return 0
        }

        if n == 1 {
            return 1
        }

        if n == 2 {
            return 2
        }

        var res = -1
        if climbResults[n] == nil {
            res = climbStairs(n-1) + climbStairs(n-2)
            climbResults[n] = res
        }

        return climbResults[n]!
}


func climbStairsIterative(_ n: Int) -> Int {
    if n == 0 {
        return 0
    }
    if n == 1 {
        return 1
    }
    if n == 2 {
        return 2
    }

    var previous = 2
    var previousPrevious = 1
    var current = 0

    for _ in 3 ... n {
        current = previous + previousPrevious
        previousPrevious = previous
        previous = current
    }

    return current
}
