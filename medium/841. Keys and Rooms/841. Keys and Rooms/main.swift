import Foundation

class StackNode {
    public var val: Int
    public var next: StackNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: StackNode?) { self.val = val; self.next = next; }
}

class Stack {
    var root: StackNode?

    init() {
        root = nil
    }
    
    func push(_ val: Int) {
        var nextRoot = self.root

        self.root = StackNode(val, nextRoot)
    }
    
    func pop() -> Int {
        if self.root == nil {
            return 0
        }

        var val = self.root!.val
        self.root = self.root!.next

        return val
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

func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
    if rooms.count == 0 {
        return true
    }

    var visited = Set<Int>()

    var s = Stack()
    s.push(0)

    while !s.isEmpty() {
        let roomNum = s.pop()

        if visited.contains(roomNum) {
            continue
        }

        for key in rooms[roomNum] {
            s.push(key)
        }

        visited.insert(roomNum)
    }

    return visited.count == rooms.count
}
