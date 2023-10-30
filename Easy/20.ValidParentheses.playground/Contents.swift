/**
 https://leetcode.com/problems/valid-parentheses/description/
 
 Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
 An input string is valid if:
 - Open brackets must be closed by the same type of brackets.
 - Open brackets must be closed in the correct order.
 - Every close bracket has a corresponding open bracket of the same type.
  
 Example 1:
 Input: s = "()"
 Output: true
 
 Example 2:
 Input: s = "()[]{}"
 Output: true
 
 Example 3:
 Input: s = "(]"
 Output: false
  
 Constraints:
 1 <= s.length <= 104
 s consists of parentheses only '()[]{}'.
 */

import Foundation

//MARK: - 1

func isValid1(_ s: String) -> Bool {
    guard s.count % 2 == 0 else { return false }
    var stack = [Character]()
    for c in s {
        if [")", "}", "]"].contains(c) && stack.isEmpty {
            return false
        } else if ["(", "{", "["].contains(c) {
            stack.append(c)
        } else if !stack.isEmpty && c == ")" && stack.last == "(" {
            stack.removeLast()
        } else if !stack.isEmpty && c == "}" && stack.last == "{" {
            stack.removeLast()
        } else if !stack.isEmpty && c == "]" && stack.last == "[" {
            stack.removeLast()
        } else {
            stack.append(c)
        }
    }
    return stack.isEmpty
}

isValid1("([}}])")

isValid1("()") //true
isValid1("()[]{}") //true
isValid1("{[]}") //true
isValid1("()()") //true
isValid1("(())") //true

isValid1("(]") //false
isValid1("(") //false
isValid1("{([))(]}") //false
isValid1(")()(") //false

//MARK: - 2

func isValid2(_ s: String) -> Bool {
    guard s.count % 2 == 0 else { return false }
    let dic: [Character:Character] = ["(":")","{":"}","[":"]"]
    var stack = [Character]()
    for c in s {
        switch c {
        case "(", "{", "[":
            stack.append(c)
        case ")", "}", "]":
            if stack.isEmpty { return false }
            if dic[stack.last!] != c { return false }
            stack.removeLast()
        default:
            break
        }
    }
    return stack.isEmpty
}

isValid2("()") //true
isValid2("()[]{}") //true
isValid2("{[]}") //true
isValid2("()()") //true
isValid2("(())") //true

isValid2("(]") //false
isValid2("(") //false
isValid2("{([))(]}") //false
isValid2(")()(") //false
isValid2("([}}])") //false
