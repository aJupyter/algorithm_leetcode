13. 找出数组中重复的数字

- [  题目](https://www.acwing.com/problem/content/description/14/)
- [  提交记录](https://www.acwing.com/problem/content/submission/14/)
- [  讨论](https://www.acwing.com/problem/content/discussion/index/14/1/)
- [  题解](https://www.acwing.com/problem/content/solution/14/1/)
- [  视频讲解](https://www.acwing.com/problem/content/video/14/)

给定一个长度为 nn 的整数数组 `nums`，数组中所有的数字都在 0∼n−10∼n−1 的范围内。

数组中某些数字是重复的，但不知道有几个数字重复了，也不知道每个数字重复了几次。

请找出数组中任意一个重复的数字。

**注意**：如果某些数字不在 0∼n−10∼n−1 的范围内，或数组中不包含重复数字，则返回 -1；

#### 数据范围

0≤n≤10000≤n≤1000

#### 样例

```
给定 nums = [2, 3, 5, 4, 3, 2, 6, 7]。

返回 2 或 3。
```

```
class Solution(object):
    def duplicateInArray(self, nums):
        """
        :type nums: List[int]
        :rtype int
        """
        # 判断所有数字是否满足0-n-1的条件
        n = len(nums)
        for num in nums:
            if num < 0 or num > n:
                return -1
        
        # 把所有数字移动到正确的位置
        for i in range(n):
            # 理想情况下 nums[i] == i
            while nums[nums[i]] != nums[i]:
                # 交换当前位置的数和nums[i]位置的数
                x = nums[i]
                y = nums[nums[i]]
                nums[i] = y
                nums[x] = x
                
            if nums[i] != i and nums[nums[i]] == nums[i]:
                return nums[i]
           
        return -1
```

