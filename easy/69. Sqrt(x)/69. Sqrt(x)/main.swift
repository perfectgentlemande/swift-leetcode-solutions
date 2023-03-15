import Foundation

func mySqrt(_ x: Int) -> Int {
    var l = 0
    var r = x

    while l <= r {
        let mid = l + (r-l)/2
        if mid*mid == x {
            return mid
        }
        if (mid-1)*(mid-1) < x && mid*mid > x {
            return mid - 1
        }
        if mid*mid > x {
            r = mid - 1
        }
        if mid*mid < x {
            l = mid + 1
        }

    }
    return -1
}
