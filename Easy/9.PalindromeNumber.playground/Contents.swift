/** https://leetcode.com/problems/palindrome-number/description/
Given an integer x, return true if x is a palindrome, and false otherwise.
Follow up: Could you solve it without converting the integer to a string?
 */
import Foundation

//MARK: - 1 - 39ms, 14.35Mb

func isPalindrome1(_ x: Int) -> Bool {
    String(x) == String(String(x).reversed())
}

isPalindrome1(121) //true
isPalindrome1(-121) //false
isPalindrome1(10) //false
isPalindrome1(0) //true

//MARK: - 2 - 28ms, 13.84Mb

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
