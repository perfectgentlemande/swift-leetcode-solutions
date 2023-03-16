import Foundation

func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
    var mappedWord = [Character: Int]()
    
    for note in ransomNote {
        if mappedWord[note] == nil {
            mappedWord[note] = 1
        } else {
            mappedWord[note] = mappedWord[note]! + 1
        }
    }
    
    for ch in magazine {
        if mappedWord[ch] != nil && mappedWord[ch]! != 0 {
            mappedWord[ch] = mappedWord[ch]! - 1
        }
    }
    
    for (_, count) in mappedWord {
        if count != 0 {
            return false
        }
    }
    
    return true
}

