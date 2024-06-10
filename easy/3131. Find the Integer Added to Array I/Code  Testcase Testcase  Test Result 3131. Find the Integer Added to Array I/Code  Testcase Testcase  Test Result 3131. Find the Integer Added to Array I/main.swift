import Foundation

func addedInteger(_ nums1: [Int], _ nums2: [Int]) -> Int {
    if nums1.count == 0 {
        return -1
    }
    
    return nums2.sorted()[0] - nums1.sorted()[0]
}

func addedIntegerBetter(_ nums1: [Int], _ nums2: [Int]) -> Int {
    if nums1.count == 0 {
        return -1
    }

    var smallest1 = nums1[0]
    for v in nums1 {
        if v < smallest1 {
            smallest1 = v
        }
    }

    var smallest2 = nums2[0]
    for v in nums2 {
        if v < smallest2 {
            smallest2 = v
        }
    }

    return smallest2 - smallest1
}
