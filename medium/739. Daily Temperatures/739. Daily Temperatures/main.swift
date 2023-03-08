import Foundation


struct TempIndex {
    var temp = 0
    var index = 0
}
class Node {
    public var val: TempIndex
    public var next: Node?
    public init() { self.val = TempIndex(); self.next = nil; }
    public init(_ val: TempIndex) { self.val = val; self.next = nil; }
    public init(_ val: TempIndex, _ next: Node?) { self.val = val; self.next = next; }
}

class Stack {
    var root: Node?

    init() {
        root = nil
    }
    
    func push(_ val: TempIndex) {
        var nextRoot = self.root

        self.root = Node(val, nextRoot)
    }
    
    func pop() {
        if self.root == nil {
            return
        }

        self.root = self.root!.next
    }
    
    func top() -> TempIndex {
        if self.root == nil {
            return TempIndex()
        }

        return self.root!.val
    }
    
    func isEmpty() -> Bool {
        return self.root == nil
    }
}

func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
    var res = Array(repeating: 0, count: temperatures.count)
    var s = Stack()

    for (i, t) in temperatures.enumerated() {
            while !s.isEmpty() && s.top().temp < t {
                var top = s.top()
                res[top.index] = i - top.index
                s.pop()
            }

            s.push(TempIndex(temp: t, index: i))
        }

        return res
}
