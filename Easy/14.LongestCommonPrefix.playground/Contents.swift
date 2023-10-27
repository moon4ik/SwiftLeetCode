/**
 https://leetcode.com/problems/longest-common-prefix/description/
 
 Write a function to find the longest common prefix string amongst an array of strings.
 If there is no common prefix, return an empty string "".

 Example 1:
 Input: strs = ["flower","flow","flight"]
 Output: "fl"
 
 Example 2:
 Input: strs = ["dog","racecar","car"]
 Output: ""
 Explanation: There is no common prefix among the input strings.
  
 Constraints:
 1 <= strs.length <= 200
 0 <= strs[i].length <= 200
 strs[i] consists of only lowercase English letters.
 */


import Foundation

//MARK: - 1

func longestCommonPrefix1(_ strs: [String]) -> String {
    guard !strs.isEmpty else { return "" }
    let min = strs.sorted(by: { $0.count < $1.count }).first!.count
    var commonPrefix = ""
    for i in 0...min {
        var temp: Substring = (strs.first ?? "").prefix(i)
        var isHasPrefix = true
        for word in strs {
            if temp != word.prefix(i) {
                isHasPrefix = false
                break
            }
        }
        if isHasPrefix {
            commonPrefix = String(temp)
        }
    }
    return commonPrefix
}

longestCommonPrefix1(["flower","flow","flight"]) //"fl"
longestCommonPrefix1(["dog","racecar","car"]) //""

//MARK: - 2

func longestCommonPrefix2(_ strs: [String]) -> String {
    guard !strs.isEmpty else { return "" }
    var commonPrefix: String = strs.sorted(by: { $0.count < $1.count }).first!
    for str in strs {
        while !str.hasPrefix(commonPrefix) {
            commonPrefix = String(commonPrefix.dropLast())
        }
    }
    return commonPrefix
}

longestCommonPrefix2(["flower","flow","flight"]) //"fl"
longestCommonPrefix2(["dog","racecar","car"]) //""
