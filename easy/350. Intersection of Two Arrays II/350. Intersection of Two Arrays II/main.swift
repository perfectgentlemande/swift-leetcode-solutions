import Foundation

func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var nums1Sorted = nums1.sorted()
    var nums2Sorted = nums2.sorted()

    var intersectVals = [Int]()

    var i = 0
    var j = 0

    while i < nums1Sorted.count && j < nums2Sorted.count {
        if nums1Sorted[i] == nums2Sorted[j] {
            intersectVals.append(nums1Sorted[i])
            i += 1
            j += 1
        } else if nums1Sorted[i] < nums2Sorted[j] {
            i += 1
        } else {
            j += 1
        }
    }

    return intersectVals
}
