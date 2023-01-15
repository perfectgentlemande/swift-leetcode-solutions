import Foundation

func largestPerimeter(_ nums: [Int]) -> Int {
    if nums.count < 3 {
        return 0
    }
    
    var sortedNums = nums
    var right = nums.count-1
    sortedNums.sort()
    
    while right >= 2 {
        if sortedNums[right-2] > sortedNums[right]-sortedNums[right-1] {
            return sortedNums[right-2] + sortedNums[right-1] + sortedNums[right]
        }
        
        right-=1
    }
    
    return 0
}

print(largestPerimeter([2, 1, 2]))
print(largestPerimeter([1, 2, 1, 10]))
