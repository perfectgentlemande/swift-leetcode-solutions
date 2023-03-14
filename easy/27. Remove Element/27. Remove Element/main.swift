import Foundation

func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    var count = 0

    var i = 0
    while i < nums.count {
        if nums[i] == val {
            count += 1
        } else {
            nums[i-count] = nums[i]
        }
        i += 1
    }

    return i - count
}

