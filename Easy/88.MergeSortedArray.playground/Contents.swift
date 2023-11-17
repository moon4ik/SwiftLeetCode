/**
 https://leetcode.com/problems/merge-sorted-array/description/
 
 You are given two integer arrays nums1 and nums2, sorted in non-decreasing order, and two integers m and n, representing the number of elements in nums1 and nums2 respectively.

 Merge nums1 and nums2 into a single array sorted in non-decreasing order.

 The final sorted array should not be returned by the function, but instead be stored inside the array nums1. To accommodate this, nums1 has a length of m + n, where the first m elements denote the elements that should be merged, and the last n elements are set to 0 and should be ignored. nums2 has a length of n.

 Example 1:
 Input: nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
 Output: [1,2,2,3,5,6]
 Explanation: The arrays we are merging are [1,2,3] and [2,5,6].
 The result of the merge is [1,2,2,3,5,6] with the underlined elements coming from nums1.
 
 Example 2:
 Input: nums1 = [1], m = 1, nums2 = [], n = 0
 Output: [1]
 Explanation: The arrays we are merging are [1] and [].
 The result of the merge is [1].
 
 Example 3:
 Input: nums1 = [0], m = 0, nums2 = [1], n = 1
 Output: [1]
 Explanation: The arrays we are merging are [] and [1].
 The result of the merge is [1].
 Note that because m = 0, there are no elements in nums1. The 0 is only there to ensure the merge result can fit in nums1.
  
 Constraints:
 nums1.length == m + n
 nums2.length == n
 0 <= m, n <= 200
 1 <= m + n <= 200
 -109 <= nums1[i], nums2[j] <= 109
  
 Follow up: Can you come up with an algorithm that runs in O(m + n) time?
 */

//MARK: - 1

func merge1(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    guard n > 0 else { return }
    guard m > 0 else { nums1 = nums2; return }
    var p1 = m-1
    var p2 = n-1
    for p in (0..<m+n).reversed() {
        if p2 < 0 { break }
        if p1 >= 0 && nums1[p1] > nums2[p2] {
            nums1[p] = nums1[p1]
            p1 -= 1
        } else {
            nums1[p] = nums2[p2]
            p2 -= 1
        }
    }
}

var nums1 = [1,2,3,0,0,0]
merge1(&nums1, 3, [2,5,6], 3) //[1,2,2,3,5,6]
print(nums1)

//MARK: - 2

func merge2(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    nums1 = Array(nums1.prefix(m) + nums2.prefix(n)).sorted()
}

var nums2 = [1,2,3,0,0,0]
merge2(&nums2, 3, [2,5,6], 3) //[1,2,2,3,5,6]
print(nums2)
