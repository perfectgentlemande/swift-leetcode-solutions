import Foundation

public class Node {
    public var val: Int
    public var children: [Node]
    public init(_ val: Int) {
        self.val = val
        self.children = []
    }
}

func traverse(_ node: Node,_ level: Int, _ res: inout [[Int]]) {
    if res.count == level {
        res.append([Int]())
    }
    res[level].append(node.val)

    for child in node.children {
        traverse(child, level+1, &res)
    }
}

func levelOrder(_ root: Node?) -> [[Int]] {
    if root == nil {
        return [[Int]]()
    }
    
    var res = [[Int]]()
    traverse(root!, 0, &res)
    
    return res
}

struct Queue {
    private var items: [Node] = []
        
    mutating func remove() -> Node {
        return items.removeLast()
    }
        
    mutating func add(_ item: Node) {
        items.insert(item, at: 0)
    }
    
    func isEmpty() -> Bool {
        return items.count == 0
    }

    func count() -> Int {
        return items.count
    }
}

func levelOrderIterative(_ root: Node?) -> [[Int]] {
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
            
            for child in node.children {
                queue.add(child)
            }
        }

        level+=1
    }

    return res
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


func levelOrderIterativeOneMore(_ root: Node?) -> [[Int]] {
    if root == nil {
        return []
    }
    
    var res = [[Int]]()
    var deque = Deque()
    deque.pushBack(NodeLevel(node: root!, level: 0))
    res.append([Int]())
    
    while !deque.isEmpty() {
        let curNodeLevel = deque.popBack()
        if curNodeLevel.level == res.count {
            res.append([Int]())
        }
        res[curNodeLevel.level].append(curNodeLevel.node.val)
        
        for child in curNodeLevel.node.children {
            deque.pushFront(NodeLevel(
                node: child,
                level: curNodeLevel.level + 1
            ))
        }
    }
    
    return res
}

var root = Node(1)
root.children = [
    Node(3),
    Node(2),
    Node(4)
]
root.children[0].children = [
    Node(5),
    Node(6)
]

print(levelOrder(root))
