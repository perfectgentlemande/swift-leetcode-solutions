import Foundation

func checkCap(_ weights: [Int], _ cap: Int, _ days: Int) -> Bool {
    var curDays = 1
    var curPack = 0

    for w in weights {
        curPack += w

        if curPack > cap {
            curPack = w
            curDays += 1
        }
    }

    return curDays <= days
}


func shipWithinDays(_ weights: [Int], _ days: Int) -> Int {
    if weights.count == 0 {
        return 0
    }
    var wMax = 0
    var wTotal = 0
    
    for w in weights {
        if w > wMax {
            wMax = w
        }
        wTotal += w
    }

    var l = wMax
    var r = wTotal

    while l < r {
        let mid = l + (r-l)/2
        
        if checkCap(weights, mid, days) {
            r = mid
        } else {
            l = mid + 1
        }
    }
    
    return l
}
