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

struct TreeNodeLevel {
    public let node: TreeNode
    public let level: Int
}

struct Deque {
    private var items: [TreeNodeLevel] = []
        
    mutating func popBack() -> TreeNodeLevel {
        return items.removeLast()
    }
        
    mutating func pushBack(_ item: TreeNodeLevel) {
        items.append(item)
    }
    
    mutating func popFront() -> TreeNodeLevel {
        return items.removeFirst()
    }
    
    mutating func pushFront(_ item: TreeNodeLevel) {
        items.insert(item, at: 0)
    }
    
    func isEmpty() -> Bool {
        return items.count == 0
    }
}

func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
    if root == nil {
        return [[Int]]()
    }

    var res = [[Int]]()
    var deque = Deque()
    deque.pushBack(TreeNodeLevel(node: root!, level: 0))

    while !deque.isEmpty() {
        let curItem = deque.popFront()

        if curItem.level == res.count {
            res.append([Int]())
        }

        if (curItem.level+1)%2 == 0 {
            if curItem.node.left != nil {
                deque.pushFront(TreeNodeLevel(node: curItem.node.left!, level: curItem.level + 1))
            }

            if curItem.node.right != nil {
                deque.pushFront(TreeNodeLevel(node: curItem.node.right!, level: curItem.level + 1))
            }

            res[curItem.level].append(curItem.node.val)
        } else {
            if curItem.node.right != nil {
                deque.pushBack(TreeNodeLevel(node: curItem.node.right!, level: curItem.level + 1))
            }

            if curItem.node.left != nil {
                deque.pushBack(TreeNodeLevel(node: curItem.node.left!, level: curItem.level + 1))
            }

            res[curItem.level] = [curItem.node.val] + res[curItem.level]
        }
    }

    return res
}

