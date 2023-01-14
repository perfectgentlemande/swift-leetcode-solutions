import Foundation

func hammingWeight(_ n: Int) -> Int {
    var count = 0
    
    var num = n
    
    while num != 0 {
        count += num & 1
        num = num >> 1
    }
    
    return count
}

print(hammingWeight(11))
print(hammingWeight(128))
print(hammingWeight(4294967293))
