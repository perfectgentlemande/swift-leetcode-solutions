import Foundation


public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
    public var next: Node?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.next = nil
    }
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

func levelOrder(_ root: Node?) -> [[Node]] {
    if root == nil {
        return []
    }

    var res = [[Node]]()
    var level = 0
    var queue = Queue()
    queue.add(root!)

    while !queue.isEmpty() {
        res.append([Node]())
        let levelLen = queue.count()

        for _ in 0...levelLen - 1 {
            let node = queue.remove()
            res[level].append(node)

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


func connect(_ root: Node?) -> Node? {
    if root == nil {
        return nil
    }
    
    var lot = levelOrder(root)
    for levelItems in lot {
        var j = 0
        while j < levelItems.count - 1 {
            levelItems[j].next = levelItems[j+1]
            j+=1
        }
    }
    return root
}

