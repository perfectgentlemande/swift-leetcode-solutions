import Foundation

func extractReversedDigits(_ x: Int) -> [Int] {
    var num = x
    var res = [Int]()
    
    while num > 0 {
        res.append(num % 10)
        num = num / 10
    }
    
    return res
}
func isPalindrome(_ x: Int) -> Bool {
    if x < 0 {
        return false
    }
    
    let reversedDigits = extractReversedDigits(x)
    
    for (index, _) in reversedDigits.enumerated() {
        if reversedDigits[index] != reversedDigits[reversedDigits.count - index - 1] {
            return false
        }
    }
    
    return true
}

print(isPalindrome(121))
print(isPalindrome(-121))
print(isPalindrome(10))
