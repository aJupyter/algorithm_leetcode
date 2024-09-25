28. 在O(1)时间删除链表结点

- [  题目](https://www.acwing.com/problem/content/description/85/)
- [  提交记录](https://www.acwing.com/problem/content/submission/85/)
- [  讨论](https://www.acwing.com/problem/content/discussion/index/85/1/)
- [  题解](https://www.acwing.com/problem/content/solution/85/1/)
- [  视频讲解](https://www.acwing.com/problem/content/video/85/)

给定单向链表的一个节点指针，定义一个函数在O(1)时间删除该结点。

假设链表一定存在，并且该节点一定不是尾节点。

#### 数据范围

链表长度 [1,500][1,500]。

#### 样例

```
输入：链表 1->4->6->8
      删掉节点：第2个节点即6（头节点为第0个节点）

输出：新链表 1->4->8
```

```python
# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution(object):
    def deleteNode(self, node):
        """
        :type node: ListNode
        :rtype: void 
        """
        node.val = node.next.val
        node.next = node.next.next
```

