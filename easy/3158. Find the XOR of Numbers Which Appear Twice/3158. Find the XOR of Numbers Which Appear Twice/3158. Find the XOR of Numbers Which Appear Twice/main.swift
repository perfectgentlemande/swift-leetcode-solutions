import Foundation

func duplicateNumbersXOR(_ nums: [Int]) -> Int {
    var res = 0
    var numsMap = [Int: Int]()
    
    for n in nums {
        if numsMap[n] == nil {
            numsMap[n] = 1
        } else {
            numsMap[n]! += 1
        }
    }
    
    numsMap.forEach({ item in
        if item.value == 2 {
            res ^= item.key
        }
    })
    
    return res
}
