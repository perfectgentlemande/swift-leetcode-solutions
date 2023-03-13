import Foundation


class QueueNode {
    public var val: Int
    public var next: QueueNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: QueueNode?) { self.val = val; self.next = next; }
}


class Queue {
    var root: QueueNode?
    var rear: QueueNode?
    var size: Int

    init() {
        root = nil
        rear = nil
        size = 0
    }
    
    func add(_ val: Int) {
        var node = QueueNode(val)

        if self.root == nil {
            self.root = node
        }
        
        if self.rear != nil {
            self.rear!.next = node
        }

        self.rear = node
        self.size += 1
    }
    
    func remove() -> Int {
        if self.root == nil {
            return 0
        }

        var curVal = self.root!.val
        if self.root === self.rear {
            self.rear = nil
        }
        self.root = self.root!.next
        self.size -= 1

        return curVal
    }
    
    func head() -> Int {
        if self.root == nil {
            return 0
        }

        return self.root!.val
    }
    
    func isEmpty() -> Bool {
        return self.root == nil
    }
}

class MyStack {
    var q1: Queue
    var q2: Queue

    init() {
        q1 = Queue()
        q2 = Queue()
    }
    
    func push(_ x: Int) {
        self.q1.add(x)

        while self.q1.size > 1 {
            self.q2.add(self.q1.remove())
        }
    }
    
    func pop() -> Int {
        if self.q1.size == 0 {
            return 0
        }

        let popped = self.q1.remove()

        while self.q2.size > 1 {
            let v = self.q2.remove()

            self.q1.add(v)
        }

        let tmpQ = q2
        self.q2 = self.q1
        self.q1 = tmpQ
        
        return popped
    }
    
    func top() -> Int {
        if self.q1.size == 0 {
            return 0
        }

        return self.q1.head()
    }
    
    func empty() -> Bool {
        return self.q1.isEmpty() && self.q2.isEmpty()
    }
}
