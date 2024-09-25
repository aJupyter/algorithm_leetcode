27. 数值的整数次方

- [  题目](https://www.acwing.com/problem/content/description/26/)
- [  提交记录](https://www.acwing.com/problem/content/submission/26/)
- [  讨论](https://www.acwing.com/problem/content/discussion/index/26/1/)
- [  题解](https://www.acwing.com/problem/content/solution/26/1/)
- [  视频讲解](https://www.acwing.com/problem/content/video/26/)

实现函数*double Power(double base, int exponent)*，求*base*的 *exponent*次方。

不得使用库函数，同时不需要考虑大数问题。

只要输出结果与答案的绝对误差不超过 10−210−2 即视为正确。

**注意：**

- 不会出现底数和指数同为0的情况
- 当底数为0时，指数一定为正
- 底数的绝对值不超过 1010，指数的取值范围 [−231,231−1][−231,231−1]。

#### 样例1

```
输入：10 ，2

输出：100
```

#### 样例2

```
输入：10 ，-2  

输出：0.01
```

快速幂模板
```
# k & 1 求的是k的最后一位

def qmi(a, b, p):
    # a ^ b % p
    res = 1
    while b: # 本质上是求b的二进制
        # 如果b的二进制表示的第0位为1,则乘上当前的a
        if b & 1: res = res * a % p
        # 往右移动一位
        b = b >> 1
        # a翻倍
        a = (a * a) % p
    return res

```
```
class Solution(object):
    def Power(self, base, exponent):
        """
        :type base: float
        :type exponent: int
        :rtype: float
        """
        res = 1
        
        is_judge = False
        if exponent < 0:
            exponent = abs(exponent)
            is_judge = True
            
        # 快速幂（只能处理指数是非负数的时候，所以将指数变为正数），本质上是把exponent拆解成二进制
        while exponent:
            # 判断exponent第0位数字是否为1
            if exponent & 1: res = res * base
            exponent >>= 1 # 移位
            base = base * base # 底数翻倍
        
        # 指数是负数需要取倒数
        if is_judge:
            return 1 / res
        
        return res
```