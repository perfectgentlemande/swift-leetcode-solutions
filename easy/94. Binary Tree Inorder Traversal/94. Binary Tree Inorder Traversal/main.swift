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

func inorderTraversal(_ root: TreeNode?) -> [Int] {
    guard root != nil else {
        return []
    }
    
    return inorderTraversal(root!.left) + [root!.val] + inorderTraversal(root!.right)
}

struct Stack {
    private var items: [TreeNode] = []
    
    mutating func pop() -> TreeNode {
        return items.removeFirst()
    }
    
    mutating func push(_ item: TreeNode) {
        items.insert(item, at: 0)
    }
    
    func isEmpty() -> Bool {
        return items.count == 0
    }
}

func inorderTraversalIterative(_ root: TreeNode?) -> [Int] {
    var res = [Int]()
    var s = Stack()

    var cur = root
    while cur != nil || !s.isEmpty() {
        while cur != nil {
            s.push(cur!)
            cur = cur!.left
        }

        var newCur = s.pop()
        res.append(newCur.val)
        cur = newCur.right
    }

    return res
}


var root = TreeNode(1)
root.right = TreeNode(2)
root.right!.left = TreeNode(3)
var output = inorderTraversal(root)
print(output)

output = inorderTraversal(nil)
print(output)

root = TreeNode(1)
output = inorderTraversal(root)
print(output)
