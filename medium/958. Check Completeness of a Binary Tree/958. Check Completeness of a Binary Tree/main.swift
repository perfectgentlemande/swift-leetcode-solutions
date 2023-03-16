import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}


class QueueNode {
    public var val: TreeNode?
    public var next: QueueNode?
    public init() { self.val = nil; self.next = nil; }
    public init(_ val: TreeNode?) { self.val = val; self.next = nil; }
    public init(_ val: TreeNode?, _ next: QueueNode?) { self.val = val; self.next = next; }
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
    
    func add(_ val: TreeNode?) {
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
    
    func remove() -> TreeNode? {
        if self.root == nil {
            return nil
        }

        var curVal = self.root!.val
        if self.root === self.rear {
            self.rear = nil
        }
        self.root = self.root!.next
        self.size -= 1

        return curVal
    }
    
    func head() -> TreeNode? {
        if self.root == nil {
            return nil
        }

        return self.root!.val
    }
    
    func isEmpty() -> Bool {
        return self.root == nil
    }
}

func isCompleteTree(_ root: TreeNode?) -> Bool {
    if root == nil {
        return false
    }
    
    var q = Queue()
    q.add(root)
    var end = false
    
    while !q.isEmpty() {
        let cur = q.remove()
        if cur == nil {
            end = true
        } else {
            if end {
                return false
            }
            
            q.add(cur!.left)
            q.add(cur!.right)
        }
    }
    
    return true
}
