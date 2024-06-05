import Foundation

func orArray(_ nums: [Int]) -> [Int] {
    var res:[Int] = []
    
    for i in 0...nums.count-2 {
        res.append(nums[i]|nums[i+1])
    }

    return res
}

print(orArray([1,3,7,15]))
