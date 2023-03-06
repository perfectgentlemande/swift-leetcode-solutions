import Foundation

func findKthPositive(_ arr: [Int], _ k: Int) -> Int {
    var l = 0
    var r = arr.count

    while l < r {
        let mid = (l + r) / 2
        if arr[mid]-mid-1 < k {
            l = mid + 1
        } else {
            r = mid
        }
    }

    return r + k
}

