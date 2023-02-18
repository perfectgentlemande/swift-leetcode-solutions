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

func invertTree(_ root: TreeNode?) -> TreeNode? {
    if root == nil {
        return nil
    }
    
    let leftInverted = invertTree(root!.left)
    let rightInverted = invertTree(root!.right)
    
    root!.left = rightInverted
    root!.right = leftInverted
    
    return root
}

struct Queue {
    private var items: [TreeNode] = []
        
    mutating func remove() -> TreeNode {
        return items.removeLast()
    }
        
    mutating func add(_ item: TreeNode) {
        items.insert(item, at: 0)
    }
    
    func isEmpty() -> Bool {
        return items.count == 0
    }

    func count() -> Int {
        return items.count
    }
}

func invertTreeIterative(_ root: TreeNode?) -> TreeNode? {
    if root == nil {
        return nil
    }
    
    var queue = Queue()
    queue.add(root!)
    
    while !queue.isEmpty() {
        let curElem = queue.remove()
        
        let tmp = curElem.left
        curElem.left = curElem.right
        curElem.right = tmp
        
        if curElem.left != nil {
            queue.add(curElem.left!)
        }
        if curElem.right != nil {
            queue.add(curElem.right!)
        }
    }
    
    return root
}
