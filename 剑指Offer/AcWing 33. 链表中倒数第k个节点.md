33. 链表中倒数第k个节点

- [  题目](https://www.acwing.com/problem/content/description/32/)
- [  提交记录](https://www.acwing.com/problem/content/submission/32/)
- [  讨论](https://www.acwing.com/problem/content/discussion/index/32/1/)
- [  题解](https://www.acwing.com/problem/content/solution/32/1/)
- [  视频讲解](https://www.acwing.com/problem/content/video/32/)

输入一个链表，输出该链表中倒数第 kk 个结点。

**注意：**

- `k >= 1`;
- 如果 kk 大于链表长度，则返回 NULL;

#### 数据范围

链表长度 [0,30][0,30]。

#### 样例

```
输入：链表：1->2->3->4->5 ，k=2

输出：4
```

```pyth
# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution(object):
    def findKthToTail(self, head, k):
        """
        :type pListHead: ListNode
        :type k: int
        :rtype: ListNode
        """
        # 这题返回的是节点
        cnt = 0 # 节点个数
        cur = head
        while head:
            cnt += 1
            head = head.next
        
        # 不能倒序遍历，倒数第k个就等于正数第cnt-k个
        if k > cnt:
            return None
        for i in range(cnt-k):
            cur = cur.next
        return cur
```

