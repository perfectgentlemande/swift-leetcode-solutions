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


func helper(_ inLeft: Int,_ inRight: Int,_ preorder: [Int],_ preIdx: inout Int,_ idxMap: [Int:Int]) -> TreeNode? {
    if inLeft > inRight {
        return nil
    }

    let rootVal = preorder[preIdx]
    var root = TreeNode(rootVal)
    preIdx = preIdx + 1

    root.left = helper(inLeft, idxMap[rootVal]!-1, preorder, &preIdx, idxMap)
    root.right = helper(idxMap[rootVal]!+1, inRight, preorder, &preIdx, idxMap)

    return root
}

func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    var preIdx = 0
    var idxMap = [Int:Int]()

    for (index, element) in inorder.enumerated() {
        idxMap[element] = index
    }

    return helper(0, inorder.count-1, preorder, &preIdx, idxMap)
}
