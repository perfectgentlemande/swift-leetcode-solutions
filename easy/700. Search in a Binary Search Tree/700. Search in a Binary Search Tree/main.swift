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

func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
    var cur = root

    while cur != nil {
        if cur!.val == val {
            return cur
        }

        if val > cur!.val {
            cur = cur!.right
        } else if val < cur!.val {
            cur = cur!.left
        }
    }

    return nil
}

func searchBSTRecursive(_ root: TreeNode?, _ val: Int) -> TreeNode? {
    if root == nil {
        return nil
    }
    if root!.val == val {
        return root
    }

    if val > root!.val {
        return searchBSTRecursive(root!.right, val)
    } else if val < root!.val {
        return searchBSTRecursive(root!.left, val)
    }

    return nil
}
