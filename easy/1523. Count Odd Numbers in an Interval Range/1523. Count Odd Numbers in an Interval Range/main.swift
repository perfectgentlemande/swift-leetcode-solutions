import Foundation

func countOdds(_ low: Int, _ high: Int) -> Int {
    var counter = 0
    
    for index in low...high {
        if index%2 != 0 {
            counter += 1
        }
    }
    
    return counter
}

print(countOdds(3, 7))
print(countOdds(8, 10))
