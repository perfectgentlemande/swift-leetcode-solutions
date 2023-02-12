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

func isMirror(_ node1: TreeNode?, _ node2: TreeNode?) -> Bool {
    if node1 == nil && node2 == nil {
        return true
    }

    if (node1 == nil) != (node2 == nil) {
        return false
    }
    
    return (node1!.val == node2!.val) &&
        isMirror(node1!.left, node2!.right) &&
        isMirror(node1!.right, node2!.left)
}

func isSymmetric(_ root: TreeNode?) -> Bool {
    return isMirror(root, root)
}


struct Deque {
    private var items: [TreeNode] = []
        
    mutating func popBack() -> TreeNode {
        return items.removeLast()
    }
        
    mutating func pushBack(_ item: TreeNode) {
        items.append(item)
    }
    
    mutating func popFront() -> TreeNode {
        return items.removeFirst()
    }
    
    mutating func pushFront(_ item: TreeNode) {
        items.insert(item, at: 0)
    }
    
    func isEmpty() -> Bool {
        return items.count == 0
    }
}


func isSymmetricIterative(_ root: TreeNode?) -> Bool {
    if root == nil {
        return true
    }

    var deque1 = Deque()
    var deque2 = Deque()
    deque1.pushBack(root!)
    deque2.pushBack(root!)

    while !deque1.isEmpty() {
        let d1Node = deque1.popFront()
        let d2Node = deque2.popFront()

        if d1Node.val != d2Node.val {
            return false
        }

        if (d1Node.left == nil) != (d2Node.right == nil) {
            return false
        }
        if (d1Node.right == nil) != (d2Node.left == nil) {
            return false
        }

        if d1Node.left != nil {
            deque1.pushBack(d1Node.left!)
        }
        if d1Node.right != nil {
            deque1.pushBack(d1Node.right!)
        }
        if d2Node.right != nil {
            deque2.pushBack(d2Node.right!)
        }
        if d2Node.left != nil {
            deque2.pushBack(d2Node.left!)
        }
    }

    return true
}
