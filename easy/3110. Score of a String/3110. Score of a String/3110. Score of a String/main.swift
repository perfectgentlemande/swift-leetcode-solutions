func modulus(_ a: Int) -> Int {
    if a < 0 {
        return -a
    }

    return a
}

func scoreOfString(_ s: String) -> Int {
    if s.count == 0 || s.count == 1 {
        return 0
    }

    var chArr = Array(s)
    var prev = chArr[0]
    var res = 0
    
    for(i, ch) in chArr.enumerated(){
        if i == 0 {
            continue
        }

        res += modulus(Int(prev.asciiValue!) - Int(ch.asciiValue!))
        prev = ch
    }
    
    return res
}
