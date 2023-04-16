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
func generateTrees(_ n: Int) -> [TreeNode?] {
    guard n > 0 else { return [] }
    return buildTrees(1, n)
}
    
func buildTrees(_ m: Int, _ n: Int) -> [TreeNode?] {
    if m > n {
        return [nil]
    } else if m == n {
        return [TreeNode(m)]
    } else {
        var res = [TreeNode?]()
        for i in m...n {
            for left in buildTrees(m, i-1) {
                for right in buildTrees(i+1, n) {
                    let root = TreeNode(i)
                    root.left = left
                    root.right = right
                    res.append(root)
                }
            }
        }
        return res
    }
}
