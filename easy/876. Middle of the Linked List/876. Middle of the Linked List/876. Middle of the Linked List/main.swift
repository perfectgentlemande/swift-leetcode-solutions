import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func count(_ head: ListNode?) -> Int {
    var p = head
    
    var count = 0
    
    while p != nil {
        count += 1
        p = p!.next
    }
    
    return count
}

func middleNode(_ head: ListNode?) -> ListNode? {
    var count = count(head)
    if count == 0 {
        return nil
    }
    
    var middleIndex = count / 2
    
    var p = head
    while middleIndex != 0 {
        p = p!.next
        
        middleIndex -= 1
    }
    
    return p
}

