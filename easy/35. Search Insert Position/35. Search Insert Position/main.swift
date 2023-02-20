import Foundation

func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    var left = 0
    var right = nums.count - 1
    var mid = (left + right) / 2

    while left <= right {
        if nums[mid] == target {
            return mid
        }
        if nums[mid] > target {
            right = mid - 1
        }
        if nums[mid] < target {
            left = mid + 1
        }
        
        mid = (left + right) / 2
    }

    return left
}
