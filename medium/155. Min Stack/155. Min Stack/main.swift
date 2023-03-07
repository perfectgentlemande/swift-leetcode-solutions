import Foundation


class Node {
    public var val: Int
    public var next: Node?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: Node?) { self.val = val; self.next = next; }
}

class MinStack {
    var root: Node?
    var minRoot: Node?

    init() {
        root = nil
        minRoot = nil
    }
    
    func push(_ val: Int) {
        var nextRoot = self.root
        var nextMinRoot = Node()
        nextMinRoot.next = self.minRoot

        if self.minRoot == nil || val < self.minRoot!.val {
            nextMinRoot.val = val
        } else {
            nextMinRoot.val = self.minRoot!.val
        }
        
        self.minRoot = nextMinRoot
        self.root = Node(val, nextRoot)
    }
    
    func pop() {
        if self.root == nil {
            return
        }

        self.root = self.root!.next
        self.minRoot = self.minRoot!.next
    }
    
    func top() -> Int {
        if self.root == nil {
            return 0
        }

        return self.root!.val
    }
    
    func getMin() -> Int {
        if self.root == nil {
            return 0
        }

        return self.minRoot!.val
    }
}

