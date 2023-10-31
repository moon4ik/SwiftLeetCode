/**
 https://leetcode.com/problems/merge-two-sorted-lists/description/
 
 You are given the heads of two sorted linked lists list1 and list2.
 Merge the two lists into one sorted list. The list should be made by splicing together the nodes of the first two lists.
 Return the head of the merged linked list.

 Example 1:
 Input: list1 = [1,2,4], list2 = [1,3,4]
 Output: [1,1,2,3,4,4]
 
 Example 2:
 Input: list1 = [], list2 = []
 Output: []
 
 Example 3:
 Input: list1 = [], list2 = [0]
 Output: [0]

 Constraints:
 The number of nodes in both lists is in the range [0, 50].
 -100 <= Node.val <= 100
 Both list1 and list2 are sorted in non-decreasing order.
 */

///Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func print(listNode: ListNode?) {
    var node: ListNode? = listNode
    while node != nil {
        if let val = node?.val {
            print(val)
        }
        node = node?.next
    }
}

//MARK: - 1

func mergeTwoLists1(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    func listNode(_ array: [Int]) -> ListNode? {
        var listNode: ListNode? = nil
        for i in array.reversed() {
            let node = ListNode(i, listNode)
            listNode = node
        }
        return listNode
    }
    
    func arrayList(from listNode: ListNode?) -> [Int] {
        var node: ListNode? = listNode
        var array = [Int]()
        repeat {
            if let val = node?.val {
                array.append(val)
            }
            node = node?.next
        } while node != nil
        return array
    }
    
    var array = [Int]()
    array.append(contentsOf: arrayList(from: list1))
    array.append(contentsOf: arrayList(from: list2))
    array = array.sorted { $0 < $1 }
    return listNode(array)
}

print(listNode: mergeTwoLists1(ListNode(1, ListNode(2, ListNode(4, nil))),
                              ListNode(1, ListNode(3, ListNode(4, nil)))))

//MARK: - 2

func mergeTwoLists2(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    var l1 = list1
    var l2 = list2
    let head = ListNode(0)
    var tail: ListNode? = head
    while l1 != nil && l2 != nil {
        if l1!.val <= l2!.val {
            tail?.next = l1
            l1 = l1?.next
        } else {
            tail?.next = l2
            l2 = l2?.next
        }
        tail = tail?.next
    }
    tail?.next = l1 == nil ? l2 : l1
    return head.next
}

print(listNode: mergeTwoLists2(ListNode(1, ListNode(2, ListNode(4, nil))),
                                ListNode(1, ListNode(3, ListNode(4, nil)))))

//MARK: - 3

func mergeTwoLists3(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    guard let l1 = list1 else { return list2 }
    guard let l2 = list2 else { return list1 }
    if l1.val < l2.val {
        l1.next = mergeTwoLists3(l1.next, l2)
        return l1
    } else {
        l2.next = mergeTwoLists3(l1, l2.next)
        return l2
    }
}

print(listNode: mergeTwoLists3(ListNode(1, ListNode(2, ListNode(4, nil))),
                                ListNode(1, ListNode(3, ListNode(4, nil)))))
