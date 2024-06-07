import Foundation

func findPermutationDifference(_ s: String, _ t: String) -> Int {
    struct CharPositions {
        var s: Int
        var t: Int
    }
    var stmap: [Character: CharPositions] = [:]
    var res = 0

    for (i, ch) in s.enumerated() {
        stmap[ch] = CharPositions(s: i, t: 0)
    }
    for (i, ch) in t.enumerated() {
        var v = stmap[ch]!
        v.t = i
        stmap[ch] = v
    }

    for (k, v) in stmap {
        var diff = v.s - v.t
        if diff < 0 {
            diff = -diff
        }

        res += diff
    }

    return res
}

