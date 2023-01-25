
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
 
func preorderTraversal(_ root: TreeNode?) -> [Int] {
    guard root != nil else {
        return []
    }
    
    return [root!.val] + preorderTraversal(root!.left) + preorderTraversal(root!.right)
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

func preorderTraversalIterative(_ root: TreeNode?) -> [Int] {
    var res = [Int]()
    var s = Stack()

    if root != nil {
        s.push(root!)
    }

    var cur = TreeNode()

    while !s.isEmpty() {
        cur = s.pop()

        res.append(cur.val)
        if cur.right != nil {
            s.push(cur.right!)
        }
         if cur.left != nil {
            s.push(cur.left!)
        }
    }

    return res
}

var root = TreeNode(1)
root.left = TreeNode(2)
root.left!.left = TreeNode(4)
root.right = TreeNode(3)
root.right!.left = TreeNode(5)
root.right!.right = TreeNode(6)
var output = preorderTraversal(root)
print(output)

root = TreeNode(1)
root.right = TreeNode(2)
root.right!.left = TreeNode(3)
output = preorderTraversal(root)
print(output)

output = preorderTraversal(nil)
print(output)

root = TreeNode(1)
output = preorderTraversal(root)
print(output)
