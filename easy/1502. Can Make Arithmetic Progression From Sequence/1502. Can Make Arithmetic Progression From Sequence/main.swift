import Foundation

func canMakeArithmeticProgression(_ arr: [Int]) -> Bool {
    var sortedArray = arr
    sortedArray.sort()
    
    if sortedArray.count <= 2 {
        return true
    }
    

    var i = sortedArray.count - 1
    while i >= 2 {
        if sortedArray[i]-sortedArray[i-1] != sortedArray[i-1]-sortedArray[i-2] {
            return false
        }
        
        i -= 1
    }
    
    return true
}

print(canMakeArithmeticProgression([3, 5, 1]))
print(canMakeArithmeticProgression([1, 2, 4]))
print(canMakeArithmeticProgression([0,0,0,0]))
