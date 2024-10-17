14. 不修改数组找出重复的数字

- [  题目](https://www.acwing.com/problem/content/description/15/)
- [  提交记录](https://www.acwing.com/problem/content/submission/15/)
- [  讨论](https://www.acwing.com/problem/content/discussion/index/15/1/)
- [  题解](https://www.acwing.com/problem/content/solution/15/1/)
- [  视频讲解](https://www.acwing.com/problem/content/video/15/)

给定一个长度为 n+1n+1 的数组`nums`，数组中所有的数均在 1∼n1∼n 的范围内，其中 n≥1n≥1。

请找出数组中任意一个重复的数，但不能修改输入的数组。

#### 数据范围

1≤n≤10001≤n≤1000

#### 样例

```
给定 nums = [2, 3, 5, 4, 3, 2, 6, 7]。

返回 2 或 3。
```

**思考题**：如果只能使用 O(1)O(1) 的额外空间，该怎么做呢？

```
# 时间复杂度O(NlogN) 空间复杂度O(1)
class Solution(object):
    def duplicateInArray(self, nums):
        """
        :type nums: List[int]
        :rtype int
        """
        # 抽屉原理：n+1个苹果放到n个抽屉中，保证每个抽屉至少有1个苹果，那么肯定有某个抽屉放了2个苹果
        # 对应到本题：n+1个数，每个数的取值范围是1-n（n个选择），那么肯定有某个数字出现了2次
        # 我们可以将数值范围1-n区间分为两个区间，分别统计每个区间中苹果的个数
        # 时间复杂度O(NlogN) 空间复杂度O(1)
        l, r = 1, len(nums) - 1 # 数值范围
        while l < r:
            mid = l + r >> 1 # mid将数值范围划分成两个区间[l, mid], [mid+1, r]
            # 如果右区间的数字个数大于右区间的长度的话，说明重复的数字（答案）就在右区间
            cnt = 0 # 右区间数字个数
            for i in nums:
                if i >= mid + 1 and i <= r:
                    cnt += 1
            if cnt > r - mid: # 算区间个数r-(mid+1)-1 = r-mid
                l = mid + 1
            # 否则在左区间
            else:
                r = mid
        return l
```

