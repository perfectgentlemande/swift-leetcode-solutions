import Foundation

class StackNode {
    public var val: Int
    public var next: StackNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: StackNode?) { self.val = val; self.next = next; }
}

class Stack {
    var root: StackNode?

    init() {
        root = nil
    }
    
    func push(_ val: Int) {
        var nextRoot = self.root

        self.root = StackNode(val, nextRoot)
    }
    
    func pop() -> Int {
        if self.root == nil {
            return 0
        }

        var val = self.root!.val
        self.root = self.root!.next

        return val
    }
    
    func top() -> Int {
        if self.root == nil {
            return 0
        }

        return self.root!.val
    }
    
    func isEmpty() -> Bool {
        return self.root == nil
    }
}


class MyQueue {
    var writer = Stack()
    var reader = Stack()
    
    init() {
       
    }
    
    func moveFromWriterToreader() {
        while !self.writer.isEmpty() {
            self.reader.push(self.writer.pop())
        }
    }
    
    func push(_ x: Int) {
        self.writer.push(x)
    }
    
    func pop() -> Int {
        if self.reader.isEmpty() {
            self.moveFromWriterToreader()
        }

        return self.reader.pop()
    }
    
    func peek() -> Int {
        if self.reader.isEmpty() {
            self.moveFromWriterToreader()
        }

        return self.reader.top()
    }
    
    func empty() -> Bool {
        return self.writer.isEmpty() && self.reader.isEmpty()
    }
}
