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

func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
    if root == nil {
        return false
    }
    
    var newTargetSum = targetSum - root!.val
    if root!.left == nil && root!.right == nil {
        return newTargetSum == 0
    }
    
    return hasPathSum(root!.left, newTargetSum) || hasPathSum(root!.right, newTargetSum)
}

struct TreeNodeSum {
    public let node: TreeNode
    public let sum: Int
}

struct Deque {
    private var items: [TreeNodeSum] = []
        
    mutating func popBack() -> TreeNodeSum {
        return items.removeLast()
    }
        
    mutating func pushBack(_ item: TreeNodeSum) {
        items.append(item)
    }
    
    mutating func popFront() -> TreeNodeSum {
        return items.removeFirst()
    }
    
    mutating func pushFront(_ item: TreeNodeSum) {
        items.insert(item, at: 0)
    }
    
    func isEmpty() -> Bool {
        return items.count == 0
    }
}

func hasPathSumIterative(_ root: TreeNode?, _ targetSum: Int) -> Bool {
    if root == nil {
        return false
    }

    var deque = Deque()
    deque.pushBack(TreeNodeSum(node: root!,sum: targetSum))

    while !deque.isEmpty() {
        let curNodeSum = deque.popFront()

        if curNodeSum.sum-curNodeSum.node.val == 0 &&
            curNodeSum.node.left == nil && curNodeSum.node.right == nil {
            return true
        }

        if curNodeSum.node.left != nil {
            deque.pushBack(TreeNodeSum(
                node: curNodeSum.node.left!,
                sum:  curNodeSum.sum - curNodeSum.node.val
            ))
        }
        if curNodeSum.node.right != nil {
            deque.pushBack(TreeNodeSum(
                node: curNodeSum.node.right!,
                sum:  curNodeSum.sum - curNodeSum.node.val
            ))
        }
    }

    return false
}
