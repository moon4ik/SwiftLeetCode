/**
 https://leetcode.com/problems/binary-tree-inorder-traversal/

 Given the root of a binary tree, return the inorder traversal of its nodes' values.

 Example 1:
 Input: root = [1,null,2,3]
 Output: [1,3,2]
 
 Example 2:
 Input: root = []
 Output: []
 
 Example 3:
 Input: root = [1]
 Output: [1]
  
 Constraints:
 The number of nodes in the tree is in the range [0, 100].
 -100 <= Node.val <= 100
  
 Follow up: Recursive solution is trivial, could you do it iteratively?
 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

//MARK: - 1 Recursive

func inorderTraversal1(_ root: TreeNode?) -> [Int] {
    
    func recursive(_ node: TreeNode?, _ answer: inout [Int]) {
        guard let node = node else { return }
        recursive(node.left, &answer)
        answer.append(node.val)
        recursive(node.right, &answer)
    }
    
    var answer = [Int]()
    recursive(root, &answer)
    return answer
}

let arr1 = inorderTraversal1(TreeNode(1, nil, TreeNode(2, TreeNode(3), nil)))
print(arr1)

//MARK: - 2 Iterative

func inorderTraversal2(_ root: TreeNode?) -> [Int] {
    var stack = Array<TreeNode>()
    var answer = [Int]()
    var current = root
    while current != nil || !stack.isEmpty {
        while current != nil {
            stack.append(current!)
            current = current!.left
        }
        current = stack.removeLast()
        answer.append(current!.val)
        current = current!.right
    }
    return answer
}

let arr2 = inorderTraversal2(TreeNode(1, nil, TreeNode(2, TreeNode(3), nil)))
print(arr2)

