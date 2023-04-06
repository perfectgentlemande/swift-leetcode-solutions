import Foundation


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func reverseList(_ head: ListNode?) -> ListNode? {
    if head == nil {
        return nil
    }
    
    var cur = head
    var newHead: ListNode?
    
    while cur != nil {
        var temp = cur
        cur = cur!.next
        temp!.next = newHead
        newHead = temp
    }
    
    return newHead
}

func reverseListRecursive(_ head: ListNode?) -> ListNode? {
    if head == nil || head!.next == nil {
        return head
    }
    
    var newHead = reverseListRecursive(head!.next)
    head!.next!.next = head
    head!.next = nil
    
    return newHead
}

