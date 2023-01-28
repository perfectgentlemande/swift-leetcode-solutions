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

var root = Node(1)
root.children = [Node(3), Node(2), Node(4)]
root.children[0].children = [Node(5), Node(6)]

print(preorder(root))
