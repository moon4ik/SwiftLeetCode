/**
 https://leetcode.com/problems/plus-one/description/
 
 You are given a large integer represented as an integer array digits, where each digits[i] is the ith digit of the integer. The digits are ordered from most significant to least significant in left-to-right order. The large integer does not contain any leading 0's.
 Increment the large integer by one and return the resulting array of digits.
 
 Example 1:
 Input: digits = [1,2,3]
 Output: [1,2,4]
 Explanation: The array represents the integer 123.
 Incrementing by one gives 123 + 1 = 124.
 Thus, the result should be [1,2,4].
 
 Example 2:
 Input: digits = [4,3,2,1]
 Output: [4,3,2,2]
 Explanation: The array represents the integer 4321.
 Incrementing by one gives 4321 + 1 = 4322.
 Thus, the result should be [4,3,2,2].
 
 Example 3:
 Input: digits = [9]
 Output: [1,0]
 Explanation: The array represents the integer 9.
 Incrementing by one gives 9 + 1 = 10.
 Thus, the result should be [1,0].
 
 Constraints:
 1 <= digits.length <= 100
 0 <= digits[i] <= 9
 digits does not contain any leading 0's.
 */

//MARK: - 1 (6ms)

func plusOne1(_ digits: [Int]) -> [Int] {
    var digits = digits
    for i in (0..<digits.count).reversed() {
        guard digits[i] == 9 else {
            digits[i] += 1
            return digits
        }
        digits[i] = 0
    }
    digits.insert(1, at: 0)
    return digits
}
plusOne1([1,9])
plusOne1([9])
plusOne1([9,9])
plusOne1([7,2,8,5,0,9,1,2,9,5,3,6,6,7,3,2,8,4,3,7,9,5,7,7,4,7,4,9,4,7,0,1,1,1,7,4,0,0,6])

//MARK: - 2 (3ms)

func plusOne2(_ digits: [Int]) -> [Int] {
    var idx = digits.last
    var plus = 1
    if let val = idx {
        if val < 9 {
            var myArray = [Int]()
            for x in 0 ..< digits.count - 1{
                myArray.append(digits[x])
            }
            myArray.append(val + 1)
            return myArray
        } else {
            var myArray = [Int]()
            for x in digits.reversed() {
                if x + plus == 10 {
                    myArray.append(0)
                } else {
                    myArray.append(x + plus)
                    plus = 0
                }
            }
            if myArray.last == 0 {
                myArray.append(1)
                myArray = myArray.reversed()
                return myArray
            }
            myArray = myArray.reversed()
            return myArray
        }
    }
    if let val = idx {
        print(val + 1)
    }
    return digits
}

plusOne2([1,2,3])
plusOne2([9])
plusOne2([9,9])
plusOne2([7,2,8,5,0,9,1,2,9,5,3,6,6,7,3,2,8,4,3,7,9,5,7,7,4,7,4,9,4,7,0,1,1,1,7,4,0,0,6])
