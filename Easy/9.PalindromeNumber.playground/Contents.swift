/** https://leetcode.com/problems/palindrome-number/description/
Given an integer x, return true if x is a palindrome, and false otherwise.
Follow up: Could you solve it without converting the integer to a string?
 */
import Foundation

extension String {
    var length: Int {
        return count
    }
    
    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }
    
    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }
    
    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }
    
    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}

func isPalindrome(_ x: Int) -> Bool {
    guard x > 0 else { return false }
    let xString = String(x)
    if xString.length == 1 {
        return true
    }
    var i: Int = 0
    var j: Int = xString.length-1
    for _ in 0..<xString.length {
        if xString[i] != xString[j] {
            return false
        } else {
            i += 1
            j -= 1
        }
    }
    return true
}

isPalindrome(121) //true
isPalindrome(-121) //false
isPalindrome(10) //false
