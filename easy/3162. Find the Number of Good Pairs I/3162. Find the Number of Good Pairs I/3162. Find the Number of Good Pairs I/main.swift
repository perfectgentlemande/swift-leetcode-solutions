import Foundation

func numberOfPairs(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> Int {
    var res = 0

    for i in nums1.indices {
        for j in nums2.indices {
            if nums1[i]%(nums2[j]*k) == 0 {
                res += 1
            }
        }
    }

    return res
}
