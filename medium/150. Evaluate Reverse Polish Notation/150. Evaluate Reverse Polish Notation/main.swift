import Foundation

class Node {
    public var val: Int
    public var next: Node?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: Node?) { self.val = val; self.next = next; }
}

class Stack {
    var root: Node?

    init() {
        root = nil
    }
    
    func push(_ val: Int) {
        var nextRoot = self.root

        self.root = Node(val, nextRoot)
    }
    
    func pop() {
        if self.root == nil {
            return
        }

        self.root = self.root!.next
    }
    
    func top() -> Int {
        if self.root == nil {
            return 0
        }

        return self.root!.val
    }
    
    func isEmpty() -> Bool {
        return self.root == nil
    }
}

func getOperation(_ operation: String) -> ((_ a: Int,_ b: Int) -> (Int))? {
    var operations: [String: (_ a: Int,_ b: Int) -> Int] = [
        "+": {(_ a: Int, _ b: Int) -> Int in
            return a + b
        },
        "-": {(_ a: Int, _ b: Int) -> Int in
            return a - b
        },
        "*": {(_ a: Int, _ b: Int) -> Int in
            return a * b
        },
        "/": {(_ a: Int, _ b: Int) -> Int in
            return a / b
        },
    ]
    
    if !operations.keys.contains(operation) {
        return nil
    }
    
    return operations[operation]
}

func evalRPN(_ tokens: [String]) -> Int {
    var s = Stack()

    for ( i,_) in tokens.enumerated() {
        var operation = getOperation(tokens[i])
        if operation == nil {
            s.push(Int(tokens[i])!)
            continue
        }
        
        let b = s.top()
        s.pop()
        let a = s.top()
        s.pop()
        
        s.push(operation!(a, b))
    }

    return s.top()
}
