import Foundation

func add(_ nums: [Int], _ sum: Int,_ i: Int, _ target: Int, _ ways: inout Int) {
    var sum1 = sum - nums[i]
    var sum2 = sum + nums[i]
    
    if i == nums.count - 1 {
        if sum1 == target {
            ways += 1
        }
        if sum2 == target {
            ways += 1
        }
        return
    }
    add(nums, sum1, i+1, target, &ways)
    add(nums, sum2, i+1, target, &ways)
}
func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
    var ways = 0
    
    add(nums, 0, 0, target, &ways)
    
    return ways
}
