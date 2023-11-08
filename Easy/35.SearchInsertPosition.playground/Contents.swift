/**
 https://leetcode.com/problems/search-insert-position/description/
 
 Given a sorted array of distinct integers and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.
 You must write an algorithm with O(log n) runtime complexity.

 Example 1:
 Input: nums = [1,3,5,6], target = 5
 Output: 2
 
 Example 2:
 Input: nums = [1,3,5,6], target = 2
 Output: 1
 
 Example 3:
 Input: nums = [1,3,5,6], target = 7
 Output: 4
  
 Constraints:
 1 <= nums.length <= 104
 -104 <= nums[i] <= 104
 nums contains distinct values sorted in ascending order.
 -104 <= target <= 104
 */

//MARK: - 1

func searchInsert1(_ nums: [Int], _ target: Int) -> Int {
    for i in 0..<nums.count {
        if nums[i] == target || nums[i] > target { return i }
    }
    return nums.count
}

searchInsert1([1,3,5,6], 5) //2
searchInsert1([1,3,5,6], 2) //1
searchInsert1([1,3,5,6], 7) //4

//MARK: - 2

func searchInsert2(_ nums: [Int], _ target: Int) -> Int {
    var start = 0
    var end = nums.count
    while start < end {
        let mid = (start + end) / 2
        if nums[mid] < target {
            start = mid + 1
        } else {
            end = mid
        }
    }
    return start
}

searchInsert2([1,3,5,6], 5) //2
searchInsert2([1,3,5,6], 2) //1
searchInsert2([1,3,5,6], 7) //4

//MARK: - 3

func searchInsert3(_ nums: [Int], _ target: Int) -> Int {
    return nums.firstIndex(where: { $0 >= target }) ?? nums.count
}

searchInsert3([1,3,5,6], 5) //2
searchInsert3([1,3,5,6], 2) //1
searchInsert3([1,3,5,6], 7) //4
