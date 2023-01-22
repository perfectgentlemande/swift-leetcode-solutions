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
