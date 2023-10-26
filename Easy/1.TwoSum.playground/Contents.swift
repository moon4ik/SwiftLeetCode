/** https://leetcode.com/problems/two-sum/description/
Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target. You may assume that each input would have exactly one solution, and you may not use the same element twice. You can return the answer in any order.
 */

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    for i in 0..<nums.count {
        for j in i+1..<nums.count {
            if (target - nums[j]) == nums[i] {
                return [i, j]
            }
        }
    }
    return []
}

twoSum([2,7,11,15], 9) //0,1
twoSum([3,2,4], 6) //1,2
twoSum([3,3], 6) //0,1
