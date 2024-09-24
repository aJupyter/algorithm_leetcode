25. 剪绳子

- [  题目](https://www.acwing.com/problem/content/description/24/)
- [  提交记录](https://www.acwing.com/problem/content/submission/24/)
- [  讨论](https://www.acwing.com/problem/content/discussion/index/24/1/)
- [  题解](https://www.acwing.com/problem/content/solution/24/1/)
- [  视频讲解](https://www.acwing.com/problem/content/video/24/)

给你一根长度为 nn 绳子，请把绳子剪成 mm 段（mm、nn 都是整数，2≤n≤582≤n≤58 并且 m≥2m≥2）。

每段的绳子的长度记为 k[1]、k[2]、……、k[m]k[1]、k[2]、……、k[m]。

k[1]k[2]…k[m]k[1]k[2]…k[m] 可能的最大乘积是多少？

例如当绳子的长度是 88 时，我们把它剪成长度分别为 2、3、32、3、3 的三段，此时得到最大的乘积 1818。

#### 样例

```
输入：8

输出：18
```

```python
class Solution(object):
    def maxProductAfterCutting(self,n):
        """
        :type length: int
        :rtype: int
        """
        # 证明：https://www.acwing.com/solution/content/731/
        # https://blog.csdn.net/Y_Mlsy/article/details/107357681
        # 选用尽量多的3，直到剩下2或者4时，用2
        if n <= 3: return 1 * (n-1)
        
        res = 1
        if n % 3 == 1: 
            res = 4
            n -= 4
        elif n % 3 == 2: 
            res = 2
            n -= 2
        
        while n: 
            res *= 3
            n -= 3
        return res
```

