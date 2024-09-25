29. 删除链表中重复的节点

- [  题目](https://www.acwing.com/problem/content/description/27/)
- [  提交记录](https://www.acwing.com/problem/content/submission/27/)
- [  讨论](https://www.acwing.com/problem/content/discussion/index/27/1/)
- [  题解](https://www.acwing.com/problem/content/solution/27/1/)
- [  视频讲解](https://www.acwing.com/problem/content/video/27/)

在一个排序的链表中，存在重复的节点，请删除该链表中重复的节点，重复的节点不保留。

#### 数据范围

链表中节点 val 值取值范围 [0,100][0,100]。
链表长度 [0,100][0,100]。

#### 样例1

```
输入：1->2->3->3->4->4->5

输出：1->2->5
```

#### 样例2

```
输入：1->1->1->2->3

输出：2->3
```

```python
# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution(object):
    def deleteDuplication(self, head):
        """
        :type head: ListNode
        :rtype: ListNode
        """
        dummy = ListNode(-1)
        dummy.next = head
        cur = dummy
        
        while cur.next:
            p = cur.next
            while p and p.val == cur.next.val: p = p.next
            
            if p == cur.next.next: cur = cur.next
            else: cur.next = p # 跨过一段重复的数字
            
        return dummy.next
```

