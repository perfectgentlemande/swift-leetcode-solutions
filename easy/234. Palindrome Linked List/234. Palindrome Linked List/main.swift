import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func invert(_ head: ListNode?) -> ListNode? {
    if head == nil {
        return nil
    }

    var curr = head!.next
    var prev = ListNode(head!.val)
    while curr != nil {
        prev = ListNode(curr!.val, prev)
        curr = curr!.next
    }

    return prev
}

func isPalindrome(_ head: ListNode?) -> Bool {
    var ass = invert(head)
    
    var p1 = head
    var p2 = ass
    
    while p1 != nil {
        if p1!.val != p2!.val {
            return false
        }

        p1 = p1!.next
        p2 = p2!.next
    }
    
    return true
}
