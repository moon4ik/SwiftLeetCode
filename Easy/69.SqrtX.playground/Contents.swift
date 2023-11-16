/**
 https://leetcode.com/problems/sqrtx/description/

 Given a non-negative integer x, return the square root of x rounded down to the nearest integer. The returned integer should be non-negative as well.
 You must not use any built-in exponent function or operator.

 For example, do not use pow(x, 0.5) in c++ or x ** 0.5 in python.

 Example 1:
 Input: x = 4
 Output: 2
 Explanation: The square root of 4 is 2, so we return 2.
 
 Example 2:
 Input: x = 8
 Output: 2
 Explanation: The square root of 8 is 2.82842..., and since we round it down to the nearest integer, 2 is returned.
  
 Constraints:
 0 <= x <= 231 - 1
 */

//MARK: - 1

func mySqrt1(_ x: Int) -> Int {
    guard x > 3 else { return x == 0 ? 0 : 1 }
    var i = 1
    var sq = i * i
    while x >= sq {
        i += 1
        sq = i * i
    }
    return i-1
}

//MARK: - 2

func mySqrt2(_ x: Int) -> Int {
    guard x > 3 else { return x == 0 ? 0 : 1 }
    var left = 0
    var right = x / 2
    while left <= right {
        let mid = (left + right) / 2
        let value = mid * mid
        if value == x {
            return mid
        } else {
            if value < x {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
    }
    return right
}
