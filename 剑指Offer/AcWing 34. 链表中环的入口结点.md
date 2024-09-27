34. 链表中环的入口结点

- [  题目](https://www.acwing.com/problem/content/description/86/)
- [  提交记录](https://www.acwing.com/problem/content/submission/86/)
- [  讨论](https://www.acwing.com/problem/content/discussion/index/86/1/)
- [  题解](https://www.acwing.com/problem/content/solution/86/1/)
- [  视频讲解](https://www.acwing.com/problem/content/video/86/)

给定一个链表，若其中包含环，则输出环的入口节点。

若其中不包含环，则输出`null`。

#### 数据范围

节点 val 值取值范围 [1,1000][1,1000]。
节点 val 值各不相同。
链表长度 [0,500][0,500]。

#### 样例

![QQ截图20181202023846.png](https://cdn.acwing.com/media/article/image/2018/12/02/19_69ba6d14f5-QQ%E6%88%AA%E5%9B%BE20181202023846.png)

```
给定如上所示的链表：
[1, 2, 3, 4, 5, 6]
2
注意，这里的2表示编号是2的节点，节点编号从0开始。所以编号是2的节点就是val等于3的节点。

则输出环的入口节点3.
```

```python
# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution(object):
    def entryNodeOfLoop(self, head):
        """
        :type head: ListNode
        :rtype: ListNode
        """
        '''
        快指针每次走两步，慢指针每次走一步，如果有环，两个指针一定会相遇
        否则，一定没环，此时快指针先走到空指针的位置
        
        如果相遇了，则让慢指针退回起点，每次走一步，快指针在相遇点往后走，每次也是走一步
        '''
        i, j = head, head # i是慢指针，j是快指针
        while i and j:
            i = i.next
            j = j.next
            # j是快指针，每次走两步，这里防止j为空，j一旦为空，则说明该链表没有环
            if j:
                j = j.next
            else: return None
            
            # 相遇代表有环
            if i == j:
                i = head
                while i != j:
                    i = i.next
                    j = j.next
                return i
                    
        return None
```

