/**
 https://leetcode.com/problems/remove-duplicates-from-sorted-list/description/
 
 Given the head of a sorted linked list, delete all duplicates such that each element appears only once. Return the linked list sorted as well.

 Example 1:
 Input: head = [1,1,2]
 Output: [1,2]

 Example 2:
 Input: head = [1,1,2,3,3]
 Output: [1,2,3]

 Constraints:
 The number of nodes in the list is in the range [0, 300].
 -100 <= Node.val <= 100
 The list is guaranteed to be sorted in ascending order.
 */

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

func deleteDuplicates1(_ head: ListNode?) -> ListNode? {
    
    func list(from array: [Int]) -> ListNode? {
        var listNode: ListNode? = nil
        for i in array.reversed() {
            let node = ListNode(i, listNode)
            listNode = node
        }
        return listNode
    }
    
    func array(from listNode: ListNode?) -> [Int] {
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
    
    let arr = array(from: head)
    var result = [Int]()
    arr.forEach { num in
        if !result.contains(num) {
            result.append(num)
        }
    }
    return list(from: result)
}

let l11 = deleteDuplicates1(ListNode(1, ListNode(1, ListNode(2))))
print(listNode: l11)
let l12 = deleteDuplicates1(ListNode(1, ListNode(1, ListNode(2, ListNode(3, ListNode(3))))))
print(listNode: l12)

//MARK: - 2

func deleteDuplicates2(_ head: ListNode?) -> ListNode? {
    var prev: ListNode?
    var current = head
    while current != nil {
        if prev?.val == current?.val {
            prev?.next = current?.next
        } else {
            prev = current
        }
        current = current?.next
    }
    return head
}

let l21 = deleteDuplicates2(ListNode(1, ListNode(1, ListNode(2))))
print(listNode: l21)
let l22 = deleteDuplicates2(ListNode(1, ListNode(1, ListNode(2, ListNode(3, ListNode(3))))))
print(listNode: l22)

