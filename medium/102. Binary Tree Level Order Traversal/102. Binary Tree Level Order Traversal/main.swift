import Foundation

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

func levelOrder(_ root: TreeNode?) -> [[Int]] {
    if root == nil {
        return []
    }
    
    var res = [[Int]]()
    var deque = Deque()
    deque.pushBack(TreeNodeLevel(node: root!, level: 0))
    res.append([Int]())
    
    while !deque.isEmpty() {
        let curNode = deque.popBack()
        res[curNode.level].append(curNode.node.val)
        
        if curNode.node.left == nil && curNode.node.right == nil {
            continue
        }
        
        if res.count == curNode.level+1 {
            res.append([Int]())
        }

        if curNode.node.left != nil {
            deque.pushFront(TreeNodeLevel(
                node: curNode.node.left!,
                level:    curNode.level + 1
            ))
        }
        if curNode.node.right != nil {
            deque.pushFront(TreeNodeLevel(
                node: curNode.node.right!,
                level:    curNode.level + 1
            ))
        }
    }
    
    return res
}

func traverse(_ node: TreeNode, _ level: Int, _ res: inout [[Int]]) {
    if res.count == level {
        res.append([Int]())
    }
    
    if node.left != nil {
        traverse(node.left!, level+1, &res)
    }
    if node.right != nil {
        traverse(node.right!, level+1, &res)
    }
}

func levelOrderRecursive(_ root: TreeNode?) -> [[Int]] {
    if root == nil {
        return []
    }
    
    var res = [[Int]]()
    traverse(root!, 0, &res)

    return res
}

struct Queue {
    private var items: [TreeNode] = []
        
    mutating func remove() -> TreeNode {
        return items.removeLast()
    }
        
    mutating func add(_ item: TreeNode) {
        items.insert(item, at: 0)
    }
    
    func isEmpty() -> Bool {
        return items.count == 0
    }

    func count() -> Int {
        return items.count
    }
}

func levelOrderIterativeOneMore(_ root: TreeNode?) -> [[Int]] {
    if root == nil {
        return []
    }

    var res = [[Int]]()
    var level = 0
    var queue = Queue()
    queue.add(root!)

    while !queue.isEmpty() {
        res.append([Int]())
        let levelLen = queue.count()

        for _ in 0...levelLen - 1 {
            let node = queue.remove()
            res[level].append(node.val)

            if node.left != nil {
                queue.add(node.left!)
            }
            if node.right != nil {
                queue.add(node.right!)
            }
        }

        level+=1
    }

    return res
}

var root = TreeNode(3)
root.left = TreeNode(9)
root.right = TreeNode(20)
root.right!.left = TreeNode(15)
root.right!.right = TreeNode(7)
var output = levelOrderIterativeOneMore(root)
print(output)
