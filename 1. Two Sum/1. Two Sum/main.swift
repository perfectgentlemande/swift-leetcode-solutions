import Foundation

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var someInts = [Int]()
    var mappedInts = [Int: Int]()
    
    for (index, value) in nums.enumerated() {
        if mappedInts.keys.contains(target-value) {
            someInts += [index, mappedInts[target-value]!]
        }
        
        mappedInts[value] = index
    }
    
    return someInts
}

print(twoSum([2, 7, 11, 15], 9))
print(twoSum([3, 2, 4], 6))
print(twoSum([3, 3], 6))
print(twoSum([-1, -2, -3, -4, -5], -8))
