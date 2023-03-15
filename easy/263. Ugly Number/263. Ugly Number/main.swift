import Foundation

func maxDivide(_ a: Int, _ b: Int) -> Int {
    var aCopy = a
    
    while a%b == 0 {
        aCopy = a / b
    }

    return aCopy
}

func isUgly(_ n: Int) -> Bool {
    var nCopy = n
    
    if nCopy == 0 {
        return false
    }
    if nCopy == 1 {
        return true
    }

    for pf in [2, 3, 5] {
        while nCopy%pf == 0 {
            nCopy = nCopy / pf
        }
    }

    return nCopy == 1
}
