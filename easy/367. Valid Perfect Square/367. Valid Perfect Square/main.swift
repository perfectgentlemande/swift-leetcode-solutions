import Foundation

func isPerfectSquare(_ num: Int) -> Bool {
    var l = 0
    var r = num

    while l <= r {
        let mid = l + (r-l)/2
        if mid*mid == num {
            return true
        }
        if mid*mid > num {
            r = mid - 1
        }
        if mid*mid < num {
            l = mid + 1
        }
    }
    
    return false
}
