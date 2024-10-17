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
# 时间复杂度O(N),空间复杂度O(1)
class Solution(object):
    def duplicateInArray(self, nums):
        """
        :type nums: List[int]
        :rtype int
        """
        n = len(nums)
        for i in nums:
            if i < 0 or i > n - 1: return -1

        # 将数字挪到指定的位置
        for i in range(n): # 当前遍历的是nums[i]，目标是nums[i] = i
            # 如果当前位置上的数的位置不对，则将当前数交换到正确位置，交换的前提是要交换的位置上的数也不对

            # 这里用循环的原因是交换完之后当前位置i上的数字仍然可能不对，不对就继续交换
            while nums[i] != i and nums[i] != nums[nums[i]]: 
                # 将当前位置的数字挪到正确的位置
                x = nums[i]
                y = nums[nums[i]]

                nums[i] = y
                nums[x] = x # 注意这里不能写nums[nums[i]]，因为上一步的已经将nums[i]变为y了

            # 如果当前位置的数的正确位置被占了，说明至少有两个一样的数字
            if nums[i] != i and nums[i] == nums[nums[i]]:
                return nums[i]


        return -1

作者：jupyter
链接：https://www.acwing.com/activity/content/code/content/8862948/
来源：AcWing
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
```

