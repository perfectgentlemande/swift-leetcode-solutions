import Foundation


class StackIntNode {
    public var val: Int
    public var next: StackIntNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: StackIntNode?) { self.val = val; self.next = next; }
}

class StackInt {
    var root: StackIntNode?

    init() {
        root = nil
    }
    
    func push(_ val: Int) {
        var nextRoot = self.root

        self.root = StackIntNode(val, nextRoot)
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

class StackStringNode {
    public var val: String
    public var next: StackStringNode?
    public init() { self.val = ""; self.next = nil; }
    public init(_ val: String) { self.val = val; self.next = nil; }
    public init(_ val: String, _ next: StackStringNode?) { self.val = val; self.next = next; }
}

class StackString {
    var root: StackStringNode?

    init() {
        root = nil
    }
    
    func push(_ val: String) {
        var nextRoot = self.root

        self.root = StackStringNode(val, nextRoot)
    }
    
    func pop() -> String {
        if self.root == nil {
            return ""
        }

        var val = self.root!.val
        self.root = self.root!.next

        return val
    }
    
    func top() -> String {
        if self.root == nil {
            return ""
        }

        return self.root!.val
    }
    
    func isEmpty() -> Bool {
        return self.root == nil
    }
}

func decodeString(_ s: String) -> String {
    var curString = ""
    var curNum = 0

    var numStack = StackInt()
    var strStack = StackString()

    for ch in s {
        if ch == "[" {
            strStack.push(curString)
            numStack.push(curNum)
            curString = ""
            curNum = 0
        } else if ch == "]" {
            let prevStrV = strStack.pop()
            let prevNumV = numStack.pop()

            var newStr = ""
            for _ in 1...prevNumV {
                newStr += curString
            }
            curString = prevStrV + newStr
        } else if ch.isNumber {
            curNum = curNum*10 + Int(String(ch))!
        } else {
            curString += String(ch)
        }
    }

    return curString
}
