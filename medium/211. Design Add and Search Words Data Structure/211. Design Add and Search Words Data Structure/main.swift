import Foundation

class TrieNode {
    let char: Character
    var children = [Character: TrieNode]()
    var isEnd = false
    
    init(_ char: Character) {
        self.char = char
    }
}

class Trie {
    let head = TrieNode("a")
}

class WordDictionary {
    
    let trie = Trie()
    init() {
        
    }
    
    func addWord(_ word: String) {
        if word == "" {
            return
        }
        
        var current = trie.head
        for char in word {
            if let node = current.children[char] {
                current = node
            } else {
                let newNode = TrieNode(char)
                current.children[char] = newNode
                current = newNode
            }
        }
        current.isEnd = true
    }
    
    func search(_ word: String) -> Bool {
        var matches: [TrieNode] = [trie.head]
        
        for char in word {
            if matches.count == 0 {
                return false
            }
            
            var newMatches = [TrieNode]()
            for match in matches {
                if char == "." {
                    newMatches.append(contentsOf: Array(match.children.values))
                } else {
                    if let found = match.children[char] {
                        newMatches.append(found)
                    }
                }
            }
            
            matches = newMatches
        }
        
        for match in matches {
            if match.isEnd {
                return true
            }
        }
        
        return false
    }
}
