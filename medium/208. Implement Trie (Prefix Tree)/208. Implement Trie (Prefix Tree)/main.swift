import Foundation

let alphabetSize = 26

class TrieNode {
    public var children: [TrieNode?]
    public var isEnd: Bool
    public init() {
        self.children = [TrieNode?]()
        for _ in 1...alphabetSize {
            self.children.append(nil)
        }
        
        self.isEnd = false
    }
}

class Trie {
    var root: TrieNode

    init() {
        self.root = TrieNode()
    }
    
    func insert(_ word: String) {
        var currentNode = self.root
        
        for char in word {
            let charIndex = char.asciiValue! - Character("a").asciiValue!

            if currentNode.children[Int(charIndex)] == nil {
                currentNode.children[Int(charIndex)] = TrieNode()
            }

            currentNode = currentNode.children[Int(charIndex)]!
        }

        currentNode.isEnd = true
    }
    
    func searchWord(_ word: String) -> TrieNode? {
        var currentNode = self.root
        
        for char in word {
            let charIndex = char.asciiValue! - Character("a").asciiValue!

            if currentNode.children[Int(charIndex)] == nil {
                return nil
            }

            currentNode = currentNode.children[Int(charIndex)]!
        }

        return currentNode
    }
    
    func search(_ word: String) -> Bool {
        let lastNode = self.searchWord(word)
        if lastNode == nil {
            return false
        }

        return lastNode!.isEnd
    }
    
    func startsWith(_ prefix: String) -> Bool {
        return self.searchWord(prefix) != nil
    }
}
