import Foundation

func isArraySpecial(_ nums: [Int]) -> Bool {
    if nums.count == 1 {
        return true
    }
    
    for i in 0...nums.count-2 {
        if nums[i]%2 == nums[i+1]%2 {
            return false
        }
    }

    return true
}
