
> Problem: [76. 最小覆盖子串](https://leetcode.cn/problems/minimum-window-substring/description/)

[TOC]
# 方法一[滑动窗口，时间复杂度高]
## 思路


        '''
        思路同209. 长度最小的子数组，都是维护一个滑动窗口，不断右扩展窗口，增加元素，根据条件来判断是否要缩小左边界

        时间复杂度O(mt+n)，t是字符集合的大小，本题字符均为英文字母，所以t=52，m=len(s), n=len(t)
        空间复杂度O(t)，统计字符需要的哈希表的大小
        '''



## Code
```Python3 []
class Solution:
    def minWindow(self, s: str, t: str) -> str:
        '''
        思路同209. 长度最小的子数组，都是维护一个滑动窗口，不断右扩展窗口，增加元素，根据条件来判断是否要缩小左边界

        时间复杂度O(mt+n)，t是字符集合的大小，本题字符均为英文字母，所以t=52，m=len(s), n=len(t)
        空间复杂度O(t)，统计字符需要的哈希表的大小
        '''
        ans_left, ans_right = -1, len(s) # s[ans_left: ans_right+1]就是答案
        cnt_t = Counter(t) # t中字符出现的次数
        cnt_s = Counter() # 记录滑窗中字符出现的次数

        l = 0 # 窗口的左边界
        for r, c in enumerate(s):
            cnt_s[c] += 1 # 右边界扩展
            # O(t), t为字符集合的大小
            while cnt_s >= cnt_t:
                # 更新答案
                if r - l < ans_right - ans_left:
                    ans_left, ans_right = l, r

                # 左边界缩小
                cnt_s[s[l]] -= 1
                l += 1
        return "" if ans_left < 0 else s[ans_left: ans_right+1]
```
  
# 方法二[滑动窗口，时间复杂度低]

## 思路
        '''
        思路同209. 长度最小的子数组，都是维护一个滑动窗口，不断右扩展窗口，增加元素，根据条件来判断是否要缩小左边界

        时间复杂度O(m+n)，m=len(s), n=len(t)
        空间复杂度O(t)，t是字符集合的大小，代表统计字符需要的哈希表的大小
        '''

## Code
```
class Solution:
    def minWindow(self, s: str, t: str) -> str:
        '''
        思路同209. 长度最小的子数组，都是维护一个滑动窗口，不断右扩展窗口，增加元素，根据条件来判断是否要缩小左边界

        时间复杂度O(m+n)，m=len(s), n=len(t)
        空间复杂度O(t)，t是字符集合的大小，代表统计字符需要的哈希表的大小
        '''
        ans_left, ans_right = -1, len(s) # s[ans_left: ans_right+1]就是答案
        cnt = defaultdict(int) # 代表t中字符出现的次数
        for c in t:
            cnt[c] += 1
        
        less = len(cnt) # 有less种字母出现次数 < t 中的字母出现次数

        l = 0 # 左指针
        for r, c in enumerate(s):
            cnt[c] -= 1 # 右边界扩展
            if cnt[c] == 0: # 窗口中c字符的数目与t中一致
                less -= 1
            
            while less == 0: # 窗口中所有字符与t中一致
                if r - l < ans_right - ans_left:
                    ans_left, ans_right = l, r
                
                # 左边界扩展
                x = s[l]
                # x 移出窗口之前，检查出现次数，
                # 如果窗口内 x 的出现次数和 t 一样， 
                # 那么 x 移出窗口后，窗口内 x 的出现次数比 t 的少
                if cnt[x] == 0: 
                    less += 1
                cnt[x] += 1
                l += 1

        return "" if ans_left < 0 else s[ans_left: ans_right+1]
```
