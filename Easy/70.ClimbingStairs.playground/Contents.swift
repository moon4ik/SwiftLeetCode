/**
 https://leetcode.com/problems/climbing-stairs/description/
 
 You are climbing a staircase. It takes n steps to reach the top.
 Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

 Example 1:
 Input: n = 2
 Output: 2
 Explanation: There are two ways to climb to the top.
 1. 1 step + 1 step
 2. 2 steps
 
 Example 2:
 Input: n = 3
 Output: 3
 Explanation: There are three ways to climb to the top.
 1. 1 step + 1 step + 1 step
 2. 1 step + 2 steps
 3. 2 steps + 1 step
  

 Constraints:
 1 <= n <= 45
 */

//MARK: - 1

func climbStairs1(_ n: Int) -> Int {
    if n == 1 { return 1 }
    if n == 2 { return 2 }
    return climbStairs1(n-1) + climbStairs1(n-2)
}

climbStairs1(1) //1
climbStairs1(2) //2
climbStairs1(5) //8
//climbStairs1(45) //a lot of time and repeated recursions...

//MARK: - 2

func climbStairs2(_ n: Int) -> Int {
    var arr = [1, 1]
    if n == 1 { return 1 }
    for i in 2...n {
        let num = arr[i-1] + arr[i-2]
        arr.append(num)
    }
    return arr.last!
}

climbStairs2(2) //2
climbStairs2(5) //8
climbStairs2(45) //1 836 311 903
