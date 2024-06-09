import Foundation

func isValid(_ word: String) -> Bool {
    if word.count < 3 {
        return false
    }
    
    var vowels : Set<Character> = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
    
    var foundConsonant = false
    var foundVowel = false
    
    for ch in word {
        if !ch.isNumber && !ch.isLetter {
            return false
        }
        
        if ch.isLetter {
            if vowels.contains(ch) {
                foundVowel = true
            } else {
                foundConsonant = true
            }
        }
    }

    return foundConsonant && foundVowel
}
