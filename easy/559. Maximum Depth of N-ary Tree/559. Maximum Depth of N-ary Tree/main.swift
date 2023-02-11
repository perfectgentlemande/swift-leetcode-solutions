import Foundation

public class Node {
    public var val: Int
    public var children: [Node]
    public init(_ val: Int) {
        self.val = val
        self.children = []
    }
}

func max(_ a: Int, _ b: Int) -> Int {
    if a > b {
        return a
    }
    
    return b
}

func maxDepth(_ root: Node?) -> Int {
    if root == nil {
        return 0
    }
    
    var res = 0
    for child in root!.children {
        res = max(res, maxDepth(child))
    }
    
    return res + 1
}

struct NodeLevel {
    public let node: Node
    public let level: Int
}

struct Deque {
    private var items: [NodeLevel] = []
        
    mutating func popBack() -> NodeLevel {
        return items.removeLast()
    }
        
    mutating func pushBack(_ item: NodeLevel) {
        items.append(item)
    }
    
    mutating func popFront() -> NodeLevel {
        return items.removeFirst()
    }
    
    mutating func pushFront(_ item: NodeLevel) {
        items.insert(item, at: 0)
    }
    
    func isEmpty() -> Bool {
        return items.count == 0
    }
}

func maxDepthIterative(_ root: Node?) -> Int {
    if root == nil {
        return 0
    }
    
    var deque = Deque()
    deque.pushFront(NodeLevel(node: root!, level: 1))
    var res = 0
    
    while !deque.isEmpty() {
        let curNodeLevel = deque.popFront()
        if curNodeLevel.level > res {
            res = curNodeLevel.level
        }
        
        for child in curNodeLevel.node.children {
            deque.pushBack(NodeLevel(node: child, level: curNodeLevel.level + 1))
        }
    }
    
    return res
}
