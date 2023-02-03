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

func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    if p == nil && q == nil {
        return true
    }
    
    if p != nil && q == nil {
        return false
    }
    
    if p == nil && q != nil {
        return false
    }
    
    return (p!.val == q!.val) && isSameTree(p!.left, q!.left) &&
    isSameTree(p!.right ,q!.right)
}

struct Stack {
    private var items: [TreeNode] = []
    
    mutating func pop() -> TreeNode {
        return items.removeFirst()
    }
    
    mutating func push(_ item: TreeNode) {
        items.insert(item, at: 0)
    }
    
    func isEmpty() -> Bool {
        return items.count == 0
    }
}

func check(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    if p == nil && q == nil {
		return true
	}
	if q == nil || p == nil {
		return false
	}
	if p.val != q.val {
		return false
	}

    return true
}

struct Stack {
	private var items: [TreeNode] = []
		
	mutating func pop() -> TreeNode {
		return items.removeFirst()
	}
		
	mutating func push(_ item: TreeNode) {
		items.insert(item, at: 0)
	}
		
	func isEmpty() -> Bool {
		return items.count == 0
	}
}

func check(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
	if p == nil && q == nil {
		return true
	}
	if q == nil || p == nil {
		return false
	}
	if p!.val != q!.val {
		return false
	}

	return true
}

func isSameTreeIterative(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
	if p == nil && q == nil {
		return true
	}

	if !check(p, q) {
		return false
	}

	var sP = Stack()
	var sQ = Stack()
	
    sP.push(p!)
	sQ.push(q!)

	while !sP.isEmpty() {
		var pVar = sP.pop()
		var qVar = sQ.pop()

		if !check(pVar, qVar) {
			return false
		}

		if !check(pVar.right, qVar.right) {
			return false
		}

		if pVar.right != nil {
			sP.push(pVar.right!)
			sQ.push(qVar.right!)
		}

		if !check(pVar.left, qVar.left) {
			return false
		}
		if pVar.left != nil {
			sP.push(pVar.left!)
			sQ.push(qVar.left!)
		}
    }
	
    return true
}

var p = TreeNode(1)
p.left = TreeNode(2)
p.right = TreeNode(3)
var q = TreeNode(1)
q.left = TreeNode(2)
q.right = TreeNode(3)
print(isSameTree(p, q))

p = TreeNode(1)
p.left = TreeNode(2)
q = TreeNode(1)
q.right = TreeNode(2)
print(isSameTree(p, q))

p = TreeNode(1)
p.left = TreeNode(2)
p.right = TreeNode(1)
q = TreeNode(1)
q.left = TreeNode(1)
q.right = TreeNode(2)
print(isSameTree(p, q))
