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

func max(_ a: Int, _ b: Int) -> Int {
    if a > b {
        return a
    }
    
    return b
}

func maxDepth(_ root: TreeNode?) -> Int {
    if root == nil {
        return 0
    }
    
    return max(maxDepth(root!.left), maxDepth(root!.right)) + 1
}

struct TreeNodeLevel {
    public let node: TreeNode
    public let level: Int
}

struct Deque {
    private var items: [TreeNodeLevel] = []
        
    mutating func popBack() -> TreeNodeLevel {
        return items.removeLast()
    }
        
    mutating func pushBack(_ item: TreeNodeLevel) {
        items.append(item)
    }
    
    mutating func popFront() -> TreeNodeLevel {
        return items.removeFirst()
    }
    
    mutating func pushFront(_ item: TreeNodeLevel) {
        items.insert(item, at: 0)
    }
    
    func isEmpty() -> Bool {
        return items.count == 0
    }
}

func maxDepthIterative(_ root: TreeNode?) -> Int {
    if root == nil {
        return 0
    }
    
    var deque = Deque()
    deque.pushFront(TreeNodeLevel(node: root!, level: 1))
    var res = 0
    
    while !deque.isEmpty() {
        let curNodeLevel = deque.popFront()
        if curNodeLevel.level > res {
            res = curNodeLevel.level
        }
        
        if curNodeLevel.node.left != nil {
            deque.pushBack(TreeNodeLevel(node: curNodeLevel.node.left!, level: curNodeLevel.level + 1))
        }
        if curNodeLevel.node.right != nil {
            deque.pushBack(TreeNodeLevel(node: curNodeLevel.node.right!, level: curNodeLevel.level + 1))
        }
    }
    
    return res
}
