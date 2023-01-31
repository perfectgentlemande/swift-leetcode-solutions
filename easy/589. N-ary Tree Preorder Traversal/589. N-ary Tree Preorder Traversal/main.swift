import Foundation

public class Node {
    public var val: Int
    public var children: [Node]
    public init(_ val: Int) {
        self.val = val
        self.children = []
    }
}

func preorder(_ root: Node?) -> [Int] {
    guard root != nil else {
        return []
    }
    
    var res = [root!.val]
    for child in root!.children {
        res = res + preorder(child)
    }
    
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

func preorderIterative(_ root: Node?) -> [Int] {
	var res = [Int]()
	var s = Stack()

	if root != nil {
		s.push(root!)
	}

	var cur = Node(0)

	while !s.isEmpty() {
		cur = s.pop()
		
		res.append(cur.val)
		var i = cur.children.count - 1
		while i >= 0 {
			if cur.children[i] != nil {
				s.push(cur.children[i])
			}

			i -= 1
		}
	}

	return res
}	

var root = Node(1)
root.children = [Node(3), Node(2), Node(4)]
root.children[0].children = [Node(5), Node(6)]

print(preorder(root))
