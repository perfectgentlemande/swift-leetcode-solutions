import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    if root == nil || root === p || root === q {
        return root
    }
    
    let lc = lowestCommonAncestor(root?.left, p, q)
    let rc = lowestCommonAncestor(root?.right, p, q)
    
    if lc == nil {
        return rc
    }
    if rc == nil {
        return lc
    }
    
    return root
}
