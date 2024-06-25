import Foundation

func max(_ a: Int, _ b: Int) -> Int {
    if a > b {
        return a
    }
    
    return b
}

func longestMonotonicSubarray(_ nums: [Int]) -> Int {
    var curMaxIncLen = 1
    var curMaxDecLen = 1
    
    for i in 0 ..< nums.count {
        var increasingLen = 1
        var decreasingLen = 1

        var prev = i
        for j in i + 1 ..< nums.count {
            if nums[j] > nums[prev] {
                increasingLen += 1
            } else {
                curMaxIncLen = max(increasingLen, curMaxIncLen)
                increasingLen = 1
            }

            if nums[j] < nums[prev] {
                decreasingLen += 1
            } else {
                curMaxDecLen = max(decreasingLen, curMaxDecLen)
                decreasingLen = 1
            }

            prev += 1
        }

        curMaxIncLen = max(increasingLen, curMaxIncLen)
        curMaxDecLen = max(decreasingLen, curMaxDecLen)
    }

    return max(curMaxIncLen, curMaxDecLen)
}

