22. 旋转数组的最小数字

- [  题目](https://www.acwing.com/problem/content/description/20/)
- [  提交记录](https://www.acwing.com/problem/content/submission/20/)
- [  讨论](https://www.acwing.com/problem/content/discussion/index/20/1/)
- [  题解](https://www.acwing.com/problem/content/solution/20/1/)
- [  视频讲解](https://www.acwing.com/problem/content/video/20/)

把一个数组最开始的若干个元素搬到数组的末尾，我们称之为数组的旋转。

输入一个升序的数组的一个旋转，输出旋转数组的最小元素。

例如数组 {3,4,5,1,2}{3,4,5,1,2} 为 {1,2,3,4,5}{1,2,3,4,5} 的一个旋转，该数组的最小值为 11。

数组可能包含重复项。

**注意**：数组内所含元素非负，若数组大小为 00，请返回 −1−1。

#### 数据范围

数组长度 [0,90][0,90]。

#### 样例

```
输入：nums = [2, 2, 2, 0, 1]

输出：0
```

```
class Solution:
    def findMin(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        # 时间复杂度O(N)
        # if len(nums): return min(nums)
        # return -1
        
        
        # 最坏时间复杂度O(N)，二分O(logN)
        n = len(nums) - 1
        if n == -1: return -1 # 空数组
        
        # 题目中告诉我们数组可能包含重复项。删除最后一段可能为平的情况，使得区间具有两段性，分界点就是最小值
        while n > 0 and nums[n] == nums[0]: n -= 1 # 最坏时间复杂度O(N)
        
        # 单调的情况
        if nums[n] >= nums[0]: return nums[0]
        
        l, r = 0, n
        while l < r:
            mid = l + r >> 1 # 左区间满足>=nums[0] 右区间满足<nums[0]
            if nums[mid] < nums[0]: # [l, mid] [mid+1, r]
                r = mid
            else:
                l = mid + 1
        
        return nums[l]
```

