26. 二进制中1的个数

- [  题目](https://www.acwing.com/problem/content/description/25/)
- [  提交记录](https://www.acwing.com/problem/content/submission/25/)
- [  讨论](https://www.acwing.com/problem/content/discussion/index/25/1/)
- [  题解](https://www.acwing.com/problem/content/solution/25/1/)
- [  视频讲解](https://www.acwing.com/problem/content/video/25/)

输入一个 3232 位整数，输出该数二进制表示中 11 的个数。

**注意**：

- 负数在计算机中用其绝对值的补码来表示。

#### 数据范围

−100≤−100≤ 输入整数 ≤100≤100

#### 样例1

```
输入：9
输出：2
解释：9的二进制表示是1001，一共有2个1。
```

#### 样例2

```
输入：-2
输出：31
解释：-2在计算机里会被表示成11111111111111111111111111111110，
      一共有31个1。
```

```python
class Solution(object):
    def NumberOf1(self,n):
        """
        :type n: int
        :rtype: int
        """
        cnt = 0
        for i in range(32):
            cnt += n >> i & 1
        return cnt
        
        '''
        求n的第k位数字: n >> k & 1
        返回n的最后一位1：lowbit(n) = n & -n
        '''
```

