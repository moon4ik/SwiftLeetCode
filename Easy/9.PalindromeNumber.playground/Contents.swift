/** 
 https://leetcode.com/problems/palindrome-number/description/
 
 Given an integer x, return true if x is a palindrome, and false otherwise.

 Example 1:
 Input: x = 121
 Output: true
 Explanation: 121 reads as 121 from left to right and from right to left.
 
 Example 2:
 Input: x = -121
 Output: false
 Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
 
 Example 3:
 Input: x = 10
 Output: false
 Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
  
 Constraints:
 -231 <= x <= 231 - 1
  
 Follow up: Could you solve it without converting the integer to a string?
 */

//MARK: - 1

func isPalindrome1(_ x: Int) -> Bool {
    String(x) == String(String(x).reversed())
}

isPalindrome1(121) //true
isPalindrome1(-121) //false
isPalindrome1(10) //false
isPalindrome1(0) //true

//MARK: - 2

func isPalindrome2(_ x: Int) -> Bool {
    if x < 0 || (x != 0 && x % 10 == 0 ) { return false }
    var half = 0
    var num = x
    while num > half {
        half = (half * 10) + (num % 10)
        num = num / 10
    }
    return num == half || num == half / 10
}

isPalindrome2(1234321) //true
isPalindrome2(-121) //false
isPalindrome2(10) //false
isPalindrome2(0) //true
