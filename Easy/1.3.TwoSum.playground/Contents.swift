/** https://leetcode.com/problems/two-sum/description/
Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target. You may assume that each input would have exactly one solution, and you may not use the same element twice. You can return the answer in any order.
 */

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    let sortedNums = nums.sorted()
    var left = 0
    var right = sortedNums.count - 1
    while left < right {
        let sum = sortedNums[left] + sortedNums[right]
        if sum == target {
            if let index1 = nums.firstIndex(of: sortedNums[left]),
               let index2 = nums.lastIndex(of: sortedNums[right]) {
                print("Third: \([index1, index2])")
                break
            }
        } else if sum < target {
            left += 1
        } else {
            right -= 1
        }
    }
    return []
}

twoSum([2,7,11,15], 9) //0,1
twoSum([3,2,4], 6) //1,2
twoSum([3,3], 6) //0,1
