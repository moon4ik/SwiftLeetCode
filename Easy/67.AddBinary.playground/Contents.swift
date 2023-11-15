/**
 Given two binary strings a and b, return their sum as a binary string.
 
 Example 1:
 Input: a = "11", b = "1"
 Output: "100"
 
 Example 2:
 Input: a = "1010", b = "1011"
 Output: "10101"
 
 Constraints:
 1 <= a.length, b.length <= 104
 a and b consist only of '0' or '1' characters.
 Each string does not contain leading zeros except for the zero itself.
 */

//MARK: - 1

func addBinary(_ a: String, _ b: String) -> String {
    let aChars: [Character] = Array(a).reversed()
    let bChars: [Character] = Array(b).reversed()
    let aLength = aChars.count
    let bLength = bChars.count
    var i = 0
    var additional = 0
    var result = [Character]()
    while i < aLength || i < bLength {
        let ac = i < aLength ? aChars[i].wholeNumberValue! : 0
        let bc = i < bLength ? bChars[i].wholeNumberValue! : 0
        let sum = ac + bc + additional
        result.append(sum % 2 == 0 ? "0" : "1")
        additional = sum / 2
        i += 1
    }
    if additional == 1 {
        result.append("1")
    }
    return String(result.reversed())
}

addBinary("11", "1") //"100"
addBinary("1111", "1111") //"11110"
addBinary("1010", "1011") //"10101"
addBinary("100", "110010") //"110110"
