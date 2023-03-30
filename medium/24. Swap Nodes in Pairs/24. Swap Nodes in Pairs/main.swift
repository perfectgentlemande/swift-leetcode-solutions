import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next;
}

func swapPairs(_ head: ListNode?) -> ListNode? {
    var tmp: ListNode? = ListNode(0, head)
    
    var curNode = tmp
    var nextNode = tmp
    var nextNextNode = tmp
    
    while true {
        if curNode == nil {
            break
        }
        
        var t = curNode
        var nextNode = curNode!.next
        
        if nextNode != nil {
            nextNextNode = nextNode!.next
        } else {
            break
        }
        
        if nextNextNode != nil {
            curNode = nextNextNode!.next
        } else {
            break
        }
        
        t!.next = nextNextNode
        nextNextNode!.next = nextNode
        nextNode!.next = curNode
        curNode = nextNode
    }
    
    return tmp!.next
}

func swapPairsRecursive(_ head: ListNode?) -> ListNode? {
    guard let next = head?.next else {
        return head
    }
            
    let newHead = ListNode(next.val)
    newHead.next = head
    newHead.next?.next = swapPairsRecursive(next.next)

    return newHead
}
