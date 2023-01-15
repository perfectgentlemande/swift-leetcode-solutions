import Foundation

func signFunc(_ x: Float64) -> Int {
    if x > 0 {
        return 1
    }
    if x < 0 {
        return -1
    }

    return 0
}

func arraySign(_ nums: [Int]) -> Int {
    var res = 1.0
    
    for num in nums {
        res *= Double(num)
    }
    
    return signFunc(res)
}

print(arraySign([-1, -2, -3, -4, 3, 2, 1]))
print(arraySign([1, 5, 0, 2, -3]))
print(arraySign([-1, 1, -1, 1, -1]))
print(arraySign([9, 72, 34, 29, -49, -22, -77, -17, -66, -75, -44, -30, -24]))
