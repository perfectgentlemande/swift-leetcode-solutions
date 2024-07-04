import Foundation

func numberOfChild(_ n: Int, _ k: Int) -> Int {
    var kCopy = k
    var i = 0
    var asc = true

    while kCopy > 0 {
        kCopy -= 1
       
        if i == n-1 {
            i -= 1
            asc = false
            continue
        }
        
        if i == 0 {
            asc = true
        }

        if asc {
            i += 1
        } else {
            i -= 1
        }
    }

    return i
}
