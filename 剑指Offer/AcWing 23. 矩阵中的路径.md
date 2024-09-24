23. 矩阵中的路径

- [  题目](https://www.acwing.com/problem/content/description/21/)
- [  提交记录](https://www.acwing.com/problem/content/submission/21/)
- [  讨论](https://www.acwing.com/problem/content/discussion/index/21/1/)
- [  题解](https://www.acwing.com/problem/content/solution/21/1/)
- [  视频讲解](https://www.acwing.com/problem/content/video/21/)

请设计一个函数，用来判断在一个矩阵中是否存在一条路径包含的字符按访问顺序连在一起恰好为给定字符串。

路径可以从矩阵中的任意一个格子开始，每一步可以在矩阵中向左，向右，向上，向下移动一个格子。

如果一条路径经过了矩阵中的某一个格子，则之后不能再次进入这个格子。

**注意：**

- 输入的路径字符串不为空；
- 所有出现的字符均为大写英文字母；

#### 数据范围

矩阵中元素的总个数 [0,900][0,900]。
路径字符串的总长度 [1,900][1,900]。

#### 样例

```
matrix=
[
  ["A","B","C","E"],
  ["S","F","C","S"],
  ["A","D","E","E"]
]

str="BCCE" , return "true" 

str="ASAE" , return "false"
```

```python
class Solution(object):
    def hasPath(self, matrix, string):
        """
        :type matrix: List[List[str]]
        :type string: str
        :rtype: bool
        """
        if not matrix: return False
        n, m = len(matrix), len(matrix[0])
        
        # 从（x, y）开始枚举，u代表string[u] 用来判断（x，y）上的字符是否等于string[u]
        def dfs(x, y, u):
            if matrix[x][y] != string[u]: return False
            if u == len(string) - 1: return True
            
            t = matrix[x][y]
            # 标记已经走过，如果一条路径经过了矩阵中的某一个格子，则之后不能再次进入这个格子。
            matrix[x][y] = '*' 
            
            dx, dy = [-1, 0, 1, 0], [0, 1, 0, -1]
            for i in range(4):
                a = dx[i] + x
                b = dy[i] + y
                if a >= 0 and a < n and b >= 0 and b < m and matrix[a][b] != '*':
                    if dfs(a, b, u + 1):
                        return True
            
            matrix[x][y] = t # 回溯
            return False
        
        
        # 找到首字母的坐标
        for i in range(n):
            for j in range(m):
                if dfs(i, j, 0):
                    return True
        return False
```

