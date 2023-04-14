import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    guard list1 != nil else { return list2 }
    guard list2 != nil else { return list1 }
           
    var list1Copy = list1
    var list2Copy = list2
    
    let dummy: ListNode? = ListNode(-1)
    var curNode = dummy

    while list1Copy != nil && list2Copy != nil {
        if list1Copy!.val < list2Copy!.val {
            curNode!.next = list1Copy
            list1Copy = list1Copy?.next
        } else {
            curNode?.next = list2Copy
            list2Copy = list2Copy?.next
        }
        
        curNode = curNode?.next
    }
    
    if list1Copy != nil {
        curNode!.next = list1Copy
    }
    if list2Copy != nil {
        curNode!.next = list2Copy
    }
    
    return dummy!.next
}



func mergeTwoListsRecursive(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    if list1 == nil && list2 == nil {
        return nil
    }
    if list1 == nil {
        return list2
    }
    if list2 == nil {
        return list1
    }

    if list1!.val < list2!.val {
        var tmp = list1!.next
        list1!.next = mergeTwoListsRecursive(tmp, list2)
        return list1
    } else {
        var tmp = list2!.next
        list2!.next = mergeTwoListsRecursive(tmp, list1)
        return list2
    }
}
