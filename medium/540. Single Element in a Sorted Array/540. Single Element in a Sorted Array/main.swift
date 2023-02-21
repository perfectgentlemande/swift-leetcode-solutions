import Foundation

func singleNonDuplicate(_ nums: [Int]) -> Int {
    var l = 0
    var r = nums.count - 1

    while l < r {
        let m = l + (r-l)/2

        let even = (r-m)%2 == 0
        if nums[m] == nums[m+1] {
            if even {
                l = m + 2
            } else {
                r = m - 1
            }
        } else if nums[m-1] == nums[m] {
            if even {
                r = m - 2
            } else {
                l = m + 1
            }
        } else {
            return nums[m]
        }
    }

    return nums[l]
}


