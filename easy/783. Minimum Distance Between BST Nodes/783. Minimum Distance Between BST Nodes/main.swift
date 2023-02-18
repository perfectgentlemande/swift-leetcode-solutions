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
    if root == nil {
        return [Int]()
    }
    var res = [Int]()

    res+=inorderTraversal(root!.left)
    res.append(root!.val)
    res+=inorderTraversal(root!.right)

    return res
}

func min(_ a: Int,_ b: Int) -> Int {
    if a < b {
        return a
    }

    return b
}

func minDiffInBST(_ root: TreeNode?) -> Int {
    var minDistance = Int.max
    
    let vars = inorderTraversal(root)
    var i = 1
    while i<vars.count {
        if vars[i]-vars[i-1] < minDistance {
            minDistance = vars[i]-vars[i-1]
        }
        i += 1
    }
    
    return minDistance
}
