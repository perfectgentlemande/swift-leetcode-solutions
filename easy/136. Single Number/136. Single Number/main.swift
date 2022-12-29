import Foundation

func singleNumber(_ nums: [Int]) -> Int {
    var res: Int = 0
    
    for n in nums {
      res ^= n
    }
    
    return res
}

print(singleNumber([2,2,1]))
print(singleNumber([4,1,2,1,2]))
print(singleNumber([1]))
