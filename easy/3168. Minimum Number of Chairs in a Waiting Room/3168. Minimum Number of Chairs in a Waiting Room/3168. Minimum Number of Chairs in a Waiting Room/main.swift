import Foundation

func minimumChairs(_ s: String) -> Int {
    if s == "" {
        return 0
    }

    var curCap = 0
    var curMax = 0
    
    for ch in s {
            if ch == "E" {
                curCap += 1
            }

            if ch == "L" {
                curCap -= 1
            }

            if curCap > curMax {
                curMax = curCap
            }
        }

        return curMax
}
