/**
 https://leetcode.com/problems/find-the-index-of-the-first-occurrence-in-a-string/description/
 
 Given two strings needle and haystack, return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.

 Example 1:
 Input: haystack = "sadbutsad", needle = "sad"
 Output: 0
 Explanation: "sad" occurs at index 0 and 6.
 The first occurrence is at index 0, so we return 0.
 
 Example 2:
 Input: haystack = "leetcode", needle = "leeto"
 Output: -1
 Explanation: "leeto" did not occur in "leetcode", so we return -1.
  
 Constraints:
 1 <= haystack.length, needle.length <= 104
 haystack and needle consist of only lowercase English characters.
 */

//MARK: - 1 (4ms)

func strStr1(_ haystack: String, _ needle: String) -> Int {
    let hArr: Array<Character> = Array(haystack)
    let nArr: Array<Character> = Array(needle)
    let hLen = hArr.count
    let nLen = nArr.count
    guard hLen >= nLen else { return -1 }
    guard nLen != 0 else { return 0 }
    for i in 0...hLen-nLen {
        if hArr[i] == nArr[0] {
            for j in 0..<nLen {
                if hArr[i+j] != nArr[j] { break }
                if j + 1 == nLen { return i }
            }
        }
    }
    return -1
}

strStr1("sadbutsad", "sad")
strStr1("leetcode", "leeto")

//MARK: - 2

func strStr2(_ haystack: String, _ needle: String) -> Int {
    if needle.count == 0 || haystack == needle { return 0 }
    guard haystack.count >= needle.count else { return -1 }
    var startIndex = haystack.startIndex
    for i in 0...(haystack.count - needle.count) {
        let endIndex = haystack.index(startIndex, offsetBy: needle.count)
        if haystack[startIndex..<endIndex] == needle { return i }
        startIndex = haystack.index(startIndex, offsetBy: 1)
    }
    return -1
}

strStr2("sadbutsad", "sad")
strStr2("leetcode", "leeto")
