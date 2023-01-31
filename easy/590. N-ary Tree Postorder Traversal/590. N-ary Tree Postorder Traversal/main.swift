import Foundation


public class Node {
    public var val: Int
    public var children: [Node]
    public init(_ val: Int) {
        self.val = val
        self.children = []
    }
}

func postorder(_ root: Node?) -> [Int] {
    guard root != nil else {
        return []
    }
    
    var res = [Int]()
    for child in root!.children {
        res = res + postorder(child)
    }
    res = res + [root!.val]
    
    return res
}

struct Stack {
    private var items: [Node] = []
		
	mutating func pop() -> Node {
		return items.removeFirst()
	}
		
	mutating func push(_ item: Node) {
		items.insert(item, at: 0)
	}
		
	func isEmpty() -> Bool {
		return items.count == 0
	}
}


func postorderIterative(_ root: Node?) -> [Int] {
    var res = [Int]()
    var s = Stack()

    if root == nil {
        return res
    }
    s.push(root!)

    while !s.isEmpty() {
        var node = s.pop()
        res.append(node.val)

        for child in node.children {
            if child != nil {
                s.push(child!)
            }
        }
    }

    return res.reversed()
}

var root = Node(1)
root.children = [Node(3), Node(2), Node(4)]
root.children[0].children = [Node(5), Node(6)]

print(postorder(root))
