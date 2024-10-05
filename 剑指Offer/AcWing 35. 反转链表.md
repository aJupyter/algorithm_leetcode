35. 反转链表

- [  题目](https://www.acwing.com/problem/content/description/33/)
- [  提交记录](https://www.acwing.com/problem/content/submission/33/)
- [  讨论](https://www.acwing.com/problem/content/discussion/index/33/1/)
- [  题解](https://www.acwing.com/problem/content/solution/33/1/)
- [  视频讲解](https://www.acwing.com/problem/content/video/33/)

定义一个函数，输入一个链表的头结点，反转该链表并输出反转后链表的头结点。

**思考题：**

- 请同时实现迭代版本和递归版本。

#### 数据范围

链表长度 [0,30][0,30]。

#### 样例

```
输入:1->2->3->4->5->NULL

输出:5->4->3->2->1->NULL
```

```python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution:
    def reverseList(self, head):
        """
        :type head: ListNode
        :rtype: ListNode
        """
        # 迭代版本 时间复杂度：O(n) 
        # cur = head
        # pre = None # 前驱节点
        # while cur:
        #     tem = cur.next # 记录后继节点
        #     cur.next = pre # 反转当前节点
        #     pre = cur # 更新前驱节点
        #     cur = tem # 更新当前节点
            
        # return pre
        
        
        # 递归版本 reverseList(cur) 返回以cur为头节点的反转链表的头节点
        if not head or not head.next: return head # 递归出口 空节点或者只有一个节点
        tail = self.reverseList(head.next)
        # 反转以head.next为头节点的链表后head.next是反转链表的尾节点
        head.next.next = head
        head.next = None
        
        return tail
```

