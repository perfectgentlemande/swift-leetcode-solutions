import Foundation

public class Node {
     public var val: Int
     public var neighbors: [Node?]
     public init(_ val: Int) {
         self.val = val
         self.neighbors = []
     }
}

class StackNode {
    public var val: Node
    public var next: StackNode?
    public init() { self.val = Node(0); self.next = nil; }
    public init(_ val: Node) { self.val = val; self.next = nil; }
    public init(_ val: Node, _ next: StackNode?) { self.val = val; self.next = next; }
}

class Stack {
    var root: StackNode?

    init() {
        root = nil
    }
    
    func push(_ val: Node) {
        var nextRoot = self.root

        self.root = StackNode(val, nextRoot)
    }
    
    func pop() {
        if self.root == nil {
            return
        }

        self.root = self.root!.next
    }
    
    func top() -> Node {
        if self.root == nil {
            return Node(0)
        }

        return self.root!.val
    }
    
    func isEmpty() -> Bool {
        return self.root == nil
    }
}

func cloneGraph(_ node: Node?) -> Node? {
    if node == nil {
        return node
    }

    var s = Stack()
    s.push(node!)
    
    var visited: [Int: Node] = [:]

    while !s.isEmpty() {
        let cur = s.top()
        s.pop()
        
        if !visited.keys.contains(cur.val) {
            visited[cur.val] = Node(cur.val)
        }
        
        for (i, _) in cur.neighbors.enumerated() {
            if !visited.keys.contains(cur.neighbors[i]!.val) {
                visited[cur.neighbors[i]!.val] = Node(cur.neighbors[i]!.val)
                s.push(cur.neighbors[i]!)
            }
                
            visited[cur.val]!.neighbors.append(visited[cur.neighbors[i]!.val])
        }
    }

    return visited[node!.val]
}
