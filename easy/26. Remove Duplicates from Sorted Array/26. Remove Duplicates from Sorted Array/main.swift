import Foundation

func removeDuplicates(_ nums: inout [Int]) -> Int {
    var count = 0
    
    for (i, _) in nums.enumerated() {
        if i < nums.count-1 && nums[i] == nums[i+1] {
            continue
        }

        nums[count] = nums[i]
        count += 1
    }
    
    return count
}
