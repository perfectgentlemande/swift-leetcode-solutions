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

var root = Node(1)
root.children = [Node(3), Node(2), Node(4)]
root.children[0].children = [Node(5), Node(6)]

print(postorder(root))
