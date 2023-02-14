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

func isUni(_ node: TreeNode, _ count: inout Int) -> Bool {
    if node.left == nil && node.right == nil {
        count += 1
        return true
    }

    var isUnival = true

    if node.left != nil {
        isUnival = isUni(node.left!, &count) && isUnival && node.left!.val == node.val
    }
    if node.right != nil {
        isUnival = isUni(node.right!, &count) && isUnival && node.right!.val == node.val
    }

    if !isUnival {
        return false
    }

    count += 1
    return true
}

func countUnivalSubtrees(_ root: TreeNode?) -> Int {
    if root == nil {
        return 0
    }
    
    var count = 0
    _ = isUni(root!, &count)
    
    return count
}
