19. 二叉树的下一个节点

- [  题目](https://www.acwing.com/problem/content/description/31/)
- [  提交记录](https://www.acwing.com/problem/content/submission/31/)
- [  讨论](https://www.acwing.com/problem/content/discussion/index/31/1/)
- [  题解](https://www.acwing.com/problem/content/solution/31/1/)
- [  视频讲解](https://www.acwing.com/problem/content/video/31/)

给定一棵二叉树的其中一个节点，请找出中序遍历序列的下一个节点。

**注意：**

- 如果给定的节点是中序遍历序列的最后一个，则返回空节点;
- 二叉树一定不为空，且给定的节点一定不是空节点；

#### 数据范围

树中节点数量 [0,100][0,100]。

#### 样例

```
假定二叉树是：[2, 1, 3, null, null, null, null]， 给出的是值等于2的节点。

则应返回值等于3的节点。

解释：该二叉树的结构如下，2的后继节点是3。
  2
 / \
1   3
```

```
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None
#         self.father = None
class Solution(object):
    def inorderSuccessor(self, q):
        """
        :type q: TreeNode
        :rtype: TreeNode
        """
        # 如果当前节点有右孩子
        if q.right:
            # 找到最左边的节点
            q = q.right
            while q.left: q = q.left
            
            return q
        
        # 如果当前节点无右孩子 找到当前节点是某父节点的左孩子，那么该父节点就是后继节点
        '''
        两种情况，例如图中的3，没有右孩子，且他不是他所有父亲节点的左孩子，所以它无后继节点，返回null
                  例如图中的1，没有有孩子，但它是其父亲节点2的左孩子，所以他的后继节点就是2，返回2
        '''
        # 沿着父域寻找当前节点是其左孩子的节点，如果当前节点存在父亲节点，且是该父亲节点的右孩子，则需要继续
        # 往上找，最终q不存在父节点或者q!=q.father.right，返回q.father，包含了图中3这种情况
        while q.father and q == q.father.right: q = q.father 
        
        return q.father
```

