/** https://leetcode.com/problems/two-sum/description/
Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target. You may assume that each input would have exactly one solution, and you may not use the same element twice. You can return the answer in any order.
 */

//MARK: - 1

func twoSum1(_ nums: [Int], _ target: Int) -> [Int] {
    for i in 0..<nums.count {
        for j in i+1..<nums.count {
            if (target - nums[j]) == nums[i] {
                return [i, j]
            }
        }
    }
    return []
}

twoSum1([2,7,11,15], 9) //0,1
twoSum1([3,2,4], 6) //1,2
twoSum1([3,3], 6) //0,1

//MARK: - 2

func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
    var dict = [Int:Int]()
    for (index, value) in nums.enumerated() {
        if let idx = dict[target-value] {
            return [index,idx]
        }
        dict[value] = index
    }
    return []
}

twoSum2([2,7,11,15], 9) //0,1
twoSum2([3,2,4], 6) //1,2
twoSum2([3,3], 6) //0,1

//MARK: - 3

func twoSum3(_ nums: [Int], _ target: Int) -> [Int] {
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

twoSum3([2,7,11,15], 9) //0,1
twoSum3([3,2,4], 6) //1,2
twoSum3([3,3], 6) //0,1

