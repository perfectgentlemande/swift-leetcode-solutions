import Foundation

func areAlmostEqual(_ s1: String, _ s2: String) -> Bool {
    var counter = 0
    
    for index in s1.indices {
        if s1[index] != s2[index] {
            counter += 1
        }
        
        if counter > 2 {
            return false
        }
    }
    
    if s1.sorted() == s2.sorted() {
        return true
    }

    return counter == 0
}

print(areAlmostEqual("bank", "kanb"))
print(areAlmostEqual("attack", "defend"))
print(areAlmostEqual("kelb", "kelb"))
