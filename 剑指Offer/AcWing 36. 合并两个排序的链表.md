36. 合并两个排序的链表

- [  题目](https://www.acwing.com/problem/content/description/34/)
- [  提交记录](https://www.acwing.com/problem/content/submission/34/)
- [  讨论](https://www.acwing.com/problem/content/discussion/index/34/1/)
- [  题解](https://www.acwing.com/problem/content/solution/34/1/)
- [  视频讲解](https://www.acwing.com/problem/content/video/34/)

输入两个递增排序的链表，合并这两个链表并使新链表中的结点仍然是按照递增排序的。

#### 数据范围

链表长度 [0,500][0,500]。

#### 样例

```
输入：1->3->5 , 2->4->5

输出：1->2->3->4->5->5
```

```python
# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.next = None

# 归并的过程 时间复杂度O(n)
class Solution(object):
    def merge(self, l1, l2):
        """
        :type l1: ListNode
        :type l2: ListNode
        :rtype: ListNode
        """
        head = ListNode(-1)
        cur = head
        while l1 and l2:
            if l1.val <= l2.val:
                cur.next = l1
                l1 = l1.next
                
            else:
                cur.next = l2
                l2 = l2.next
            cur = cur.next
       
        cur.next = l1 if l1 else l2     
        # while l1:
        #     cur.next = l1
        #     l1 = l1.next
        #     cur = cur.next
        # while l2:
        #     cur.next = l2
        #     l2 = l2.next
        #     cur = cur.next
        
        return head.next
```

