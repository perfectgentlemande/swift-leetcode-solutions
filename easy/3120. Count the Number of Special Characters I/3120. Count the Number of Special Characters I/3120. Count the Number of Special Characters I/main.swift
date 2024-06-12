import Foundation

func numberOfSpecialChars(_ word: String) -> Int {
    var mappedCharsLower = Set<Character>()
    var mappedCharsNotLower = Set<Character>()
    var count = 0
    
    for ch in word {
        if ch.isLowercase {
            mappedCharsLower.insert(ch)
        } else {
            mappedCharsNotLower.insert(Character(String(ch).lowercased()))
        }
    }
    
    for ch in mappedCharsLower {
        if mappedCharsNotLower.contains(ch) {
            count += 1
        }
    }

    return count
}
