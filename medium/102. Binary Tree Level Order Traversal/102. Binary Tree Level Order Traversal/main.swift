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
		traverse(node.left!, level+1, res)
	}
	if node.right != nil {
		traverse(node.right!, level+1, res)
	}
}

func levelOrder(_ root: TreeNode?) -> [[Int]] {
    if root == nil {
        return []
    }
    
    var res = [[Int]]()
	traverse(root!, 0, res)

	return res
}


print("Hello, World!")

