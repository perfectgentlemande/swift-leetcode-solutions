import Foundation

var bad = 0

func isBadVersion(_ version: Int) -> Bool {
    return version == bad
}

func firstBadVersion(_ n: Int) -> Int {
    var l = 1
    var r = n

    var curBadVersion = -1
    while l <= r {
        var mid = l + (r-l)/2
        if isBadVersion(mid) {
            r = mid - 1
            curBadVersion = mid
        } else {
            l = mid + 1
        }
    }

    return curBadVersion
}
