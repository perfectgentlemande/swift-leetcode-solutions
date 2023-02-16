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

func helper(_ inLeft: Int, _ inRight: Int, _ postorder: [Int], _ postIdx: inout Int, _ idxMap: [Int: Int])  -> TreeNode? {
    if inLeft > inRight {
        return nil
    }

    var rootVal = postorder[postIdx]
    var root = TreeNode(rootVal)
    postIdx = postIdx - 1

    root.right = helper(idxMap[rootVal]!+1, inRight, postorder, &postIdx, idxMap)
    root.left = helper(inLeft, idxMap[rootVal]!-1, postorder, &postIdx, idxMap)

    return root
}

func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
    var postorderVar = postorder
    
    var postIdx = postorder.count - 1
    var idx = 0
    var idxMap: [Int: Int] = [:]

     for (index, element) in inorder.enumerated() {
        idxMap[element] = index
    }

    return helper(0, inorder.count - 1, postorderVar, &postIdx, idxMap)
}

print("Hello, World!")

