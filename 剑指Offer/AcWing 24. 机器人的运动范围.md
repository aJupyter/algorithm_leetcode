24. 机器人的运动范围

- [  题目](https://www.acwing.com/problem/content/description/22/)
- [  提交记录](https://www.acwing.com/problem/content/submission/22/)
- [  讨论](https://www.acwing.com/problem/content/discussion/index/22/1/)
- [  题解](https://www.acwing.com/problem/content/solution/22/1/)
- [  视频讲解](https://www.acwing.com/problem/content/video/22/)

地上有一个 mm 行和 nn 列的方格，横纵坐标范围分别是 0∼m−10∼m−1 和 0∼n−10∼n−1。

一个机器人从坐标 (0,0)(0,0) 的格子开始移动，每一次只能向左，右，上，下四个方向移动一格。

但是不能进入行坐标和列坐标的数位之和大于 kk 的格子。

请问该机器人能够达到多少个格子？

**注意**:

1. `0<=m<=50`
2. `0<=n<=50`
3. `0<=k<=100`

#### 样例1

```
输入：k=7, m=4, n=5

输出：20
```

#### 样例2

```
输入：k=18, m=40, n=40

输出：1484

解释：当k为18时，机器人能够进入方格（35,37），因为3+5+3+7 = 18。
      但是，它不能进入方格（35,38），因为3+5+3+8 = 19。
```

```python
class Solution(object):
    def movingCount(self, k, m, n):
        """
        :type threshold: int
        :type rows: int
        :type cols: int
        :rtype: int
        """
        if not n or not m: return 0
        def cal(x, y):
            # 计算x和y的数位和
            ls = []
            while x:
                ls.append(x % 10)
                x //= 10
            while y:
                ls.append(y % 10)
                y //= 10
            
            return sum(ls)
            
        cnt = 0
        # bfs
        q = [(0, 0)] # 起始位置
        dx, dy = [-1, 0, 1, 0], [0, 1, 0, -1]
        
        st = []
        for i in range(m):
            tem = []
            for j in range(n):
                tem.append(0)
            st.append(tem)
        # 状态数组，判断当前位置有没有走过，0代表未走，1代表走过
        # print(st)
        while q:
            t = q.pop(0)
            x, y = t[0], t[1]
            # 如果新位置走过或者横纵坐标和大于阈值跳过
            if st[x][y] or cal(x, y) > k: continue
            cnt += 1
            st[x][y] = 1
            # print(x, y)
            # 扩展
            for i in range(4):
                a = dx[i] + x
                b = dy[i] + y
                if a >= 0 and a < m and b >= 0 and b < n:
                    q.append((a, b))
        return cnt
```

