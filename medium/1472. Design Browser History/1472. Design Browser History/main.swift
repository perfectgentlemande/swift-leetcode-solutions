import Foundation

class BrowserHistory {
    class DLLNode {
        public var val: String
        public var next: DLLNode?
        public var previous: DLLNode?
        public init() { self.val = ""; self.next = nil; self.previous = nil}
        public init(_ val: String) { self.val = val; self.next = nil; self.previous = nil}
        public init(_ val: String, _ next: DLLNode?) { self.val = val; self.next = next; self.previous = nil}
        public init(_ val: String, _ next: DLLNode?, _ previous: DLLNode?) { self.val = val; self.next = next; self.previous = previous}
    }
    
    var head: DLLNode
    var curr: DLLNode

    init(_ homepage: String) {
        head = DLLNode(homepage)
        curr = head
    }
    
    func visit(_ url: String) {
        var newNode = DLLNode(url)
        self.curr.next = newNode
        newNode.previous = self.curr
        curr = newNode
    }
    
    func back(_ steps: Int) -> String {
        var s = steps
        while (curr.previous != nil && s > 0) {
            curr = curr.previous!
            s -= 1
        }
        
        return curr.val
    }
    
    func forward(_ steps: Int) -> String {
        var s = steps
        while (curr.next != nil && s > 0) {
            curr = curr.next!
            s -= 1
        }
        
        return curr.val
    }
}
