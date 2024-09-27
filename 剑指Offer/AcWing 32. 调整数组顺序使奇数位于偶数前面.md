32. 调整数组顺序使奇数位于偶数前面

- [  题目](https://www.acwing.com/problem/content/description/30/)
- [  提交记录](https://www.acwing.com/problem/content/submission/30/)
- [  讨论](https://www.acwing.com/problem/content/discussion/index/30/1/)
- [  题解](https://www.acwing.com/problem/content/solution/30/1/)
- [  视频讲解](https://www.acwing.com/problem/content/video/30/)

输入一个整数数组，实现一个函数来调整该数组中数字的顺序。

使得所有的奇数位于数组的前半部分，所有的偶数位于数组的后半部分。

#### 数据范围

数组长度 [0,100][0,100]。
数组内元素取值范围 [0,100][0,100]。

#### 样例

```
输入：[1,2,3,4,5]

输出: [1,3,5,2,4]
```

```python
class Solution(object):
    def reOrderArray(self, array):
        """
        :type array: List[int]
        :rtype: void
        """
        # 双指针
        # j = 0
        # for i in range(len(array)):
        #     if array[i] % 2 == 1:
        #         array[i], array[j] = array[j], array[i]
        #         j += 1
        # return array
        
        i, j = 0, len(array) - 1
        while i < j:
            # i找第一个偶数
            while i < j and array[i] % 2 == 1: i += 1
            # j找第一个奇数
            while i < j and array[j] % 2 == 0: j -= 1
            if i < j: array[i], array[j] = array[j], array[i]
            
        return array
```

