import Foundation

func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
    var l = 0
    var r = letters.count - 1
    
    if letters[r] <= target {
        return letters[0]
    }
    
    var curSym = target
    while l <= r {
        let mid = l + (r-l)/2

        if letters[mid] <= target {
            l = mid + 1
        }
        if letters[mid] > target {
            curSym = letters[mid]
            r = mid - 1
        }
    }

    return curSym
}
