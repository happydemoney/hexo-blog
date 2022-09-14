---
title: 【算法】深入掌握算法系列
---

[JavaScript-Algorithms](https://github.com/sisterAn/JavaScript-Algorithms) - 题源地址
[labuladong的算法小抄](https://labuladong.gitee.io/algo/) - 好的算法学习资料

## 前言

作为业务开发，虽然在平常开发中很少写算法，但当我们需要深入框架、开发语言、开源库时，懂算法将大大提高我们看源码的能力。例如 ：

- virtual-dom diff 算法做了一些约定，后将原先 O(n3) 的时间复杂度降到了O(n) ，核心原理就是一个树的深度优先搜索
- babel 这些就是一些编译原理的 parser 生成抽象语法树的知识，再将抽象语法树进行转换操作生成文件
- 浏览器的 history，底层可以使用栈来实现
- webpack 中利用 tree-shaking 优化
- v8 中的调用栈、消息队列等等

这些就大量使用了算法，看懂了就能更好的了解它们的性能，更高效的解决问题，提升我们的代码质量与思维视野，进阶到更高 Level，赚更多钱💰💰💰。

## 计划

给自己定个小目标，把下面深入掌握算法的小题全过一遍，每天最少一题；
目前先附上源地址，后续自己做好后更新题目后的链接地址，并标记清除，比如 ✅图解leetcode88：合并两个有序数组

## 深入掌握算法

分为四个模块：数据结构、算法、设计、基础架构等

###  数据结构

#### 数组篇

- [✅图解leetcode88：合并两个有序数组](https://leetcode-cn.com/problems/merge-sorted-array/solution/tou-ge-lan-shi-yong-yuan-sheng-api-by-ha-qpg5/)
- [✅字节&leetcode1：两数之和](https://leetcode-cn.com/problems/two-sum/solution/xiao-nan-gua-kong-jian-huan-shi-jian-by-9kjta/)
- [✅腾讯&leetcode15：三数之和](https://leetcode-cn.com/problems/3sum/solution/xiao-nan-gua-pai-xu-shuang-zhi-zhen-by-h-i03k/)
- [字节：N数之和](https://github.com/sisterAn/JavaScript-Algorithms/issues/128)
- [腾讯：数组扁平化、去重、排序 ](https://github.com/sisterAn/JavaScript-Algorithms/issues/5)
- [✅leetcode349：给定两个数组，编写一个函数来计算它们的交集](https://leetcode-cn.com/problems/intersection-of-two-arrays/solution/xiao-nan-gua-pai-xu-jia-shuang-zhi-zhen-tbapt/)
- [✅华为&leetcode146：设计和实现一个LRU（最近最少使用）缓存机制](https://leetcode-cn.com/problems/lru-cache/solution/xiao-nan-gua-shuang-xiang-lian-biao-ji-m-q7rt/)
- [阿里算法题：编写一个函数计算多个数组的交集](https://github.com/sisterAn/JavaScript-Algorithms/issues/10)
- [✅leetcode352: 将数据流变为多个不相交区间](https://leetcode-cn.com/problems/data-stream-as-disjoint-intervals/solution/xiao-nan-gua-he-li-li-yong-zhan-by-happy-rsd8/)

#### 链表
- [✅leetcode21：合并两个有序链表](https://leetcode-cn.com/problems/merge-two-sorted-lists/solution/xiao-nan-gua-die-dai-by-happydemoney-c19o/)
- [✅有赞&leetcode141：判断一个单链表是否有环](https://leetcode-cn.com/problems/linked-list-cycle/solution/xiao-nan-gua-kuai-man-zhi-zhen-by-happyd-hnyl/)
- [✅图解leetcode206：反转链表](https://leetcode-cn.com/problems/reverse-linked-list/solution/xiao-nan-gua-xian-jin-hou-chu-zhan-by-ha-m56f/)
- [✅leetcode876：求链表的中间结点](https://leetcode-cn.com/problems/middle-of-the-linked-list/solution/xiao-nan-gua-bian-li-lian-biao-ji-suan-c-nfvg/)
- [✅leetcode19：删除链表倒数第 n 个结点](https://leetcode-cn.com/problems/remove-nth-node-from-end-of-list/solution/xiao-nan-gua-jian-dan-de-die-dai-by-happ-8mo6/)
- [✅图解字节&leetcode160：编写一个程序，找到两个单链表相交的起始节点](https://leetcode-cn.com/problems/intersection-of-two-linked-lists/solution/xiao-nan-gua-shuang-zhi-zhen-by-happydem-4gsx/)
- [✅腾讯&leetcode611：有效三角形的个数](https://leetcode-cn.com/problems/valid-triangle-number/solution/xiao-nan-gua-pai-xu-er-fen-by-happydemon-vrkq/)
- [快手算法：链表求和](https://github.com/sisterAn/JavaScript-Algorithms/issues/114)
- [leetcode42：接雨水问题](https://github.com/sisterAn/JavaScript-Algorithms/issues/122)

#### 字符串
- [✅字节&leetcode151：翻转字符串里的单词](https://leetcode-cn.com/problems/reverse-words-in-a-string/solution/xiao-yuan-sheng-apiyi-tao-lu-by-happydem-5yiv/)
- [✅图解拼多多&leetcode14：最长公共前缀（LCP）](https://leetcode-cn.com/problems/longest-common-prefix/solution/xiao-zhan-jia-lin-shi-bian-liang-by-happ-jr44/)
- [百度：实现一个函数，判断输入是不是回文字符串](https://github.com/sisterAn/JavaScript-Algorithms/issues/20)
- [✅字节&Leetcode3：无重复字符的最长子串](https://leetcode-cn.com/problems/longest-substring-without-repeating-characters/solution/xiao-dui-lie-by-happydemoney-k6uq/)
- [✅Facebook&字节&leetcode415: 字符串相加](https://leetcode-cn.com/problems/add-strings/solution/xiao-shuang-zhi-zhen-die-dai-wei-bu-by-h-fi94/)
- [✅腾讯&leetcode43：字符串相乘](https://leetcode-cn.com/problems/multiply-strings/solution/zi-fu-chuan-xiang-cheng-by-leetcode-solution/)
- [✅腾讯&剑指 Offer 67. 把字符串转换成整数](https://leetcode-cn.com/problems/string-to-integer-atoi/solution/)

#### 栈
- [✅字节&leetcode155：最小栈（包含getMin函数的栈）](https://leetcode-cn.com/problems/min-stack/solution/xiao-nan-gua-zui-xiao-zhan-by-happydemon-4bbb/)
- [✅图解腾讯&哔哩哔哩&leetcode20：有效的括号](https://leetcode-cn.com/problems/valid-parentheses/solution/xiao-nan-gua-zuo-jin-you-chu-by-happydem-kq7g/)
- [✅leetcode1047：删除字符串中的所有相邻重复项](https://leetcode-cn.com/problems/remove-all-adjacent-duplicates-in-string/solution/xiao-nan-gua-yong-zhan-jian-dan-chu-li-b-foi7/)
- [leetcode1209：删除字符串中的所有相邻重复项 II](https://github.com/sisterAn/JavaScript-Algorithms/issues/27)
- [面试真题：删除字符串中出现次数 >= 2 次的相邻字符](https://github.com/sisterAn/JavaScript-Algorithms/issues/28)

#### 队列
- [✅腾讯&剑指offer09：用两个栈实现队列](https://leetcode-cn.com/problems/yong-liang-ge-zhan-shi-xian-dui-lie-lcof/solution/xiao-nan-gua-zhu-zhan-fu-zhu-zhan-by-hap-tdmu/)
- [✅leetcode239：滑动窗口最大值问题](https://leetcode-cn.com/problems/sliding-window-maximum/solution/hua-dong-chuang-kou-zui-da-zhi-by-leetco-ki6m/)
- [✅字节&leetcode151：翻转字符串里的单词](https://leetcode-cn.com/problems/reverse-words-in-a-string/solution/xiao-yuan-sheng-apiyi-tao-lu-by-happydem-5yiv/)
- [✅字节&Leetcode3：无重复字符的最长子串](https://leetcode-cn.com/problems/longest-substring-without-repeating-characters/solution/xiao-dui-lie-by-happydemoney-k6uq/)

#### 哈希表
- [✅leetcode349：给定两个数组，编写一个函数来计算它们的交集](https://leetcode-cn.com/problems/intersection-of-two-arrays/solution/xiao-nan-gua-pai-xu-jia-shuang-zhi-zhen-tbapt/)
- [✅字节&leetcode1：两数之和](https://leetcode-cn.com/problems/two-sum/solution/xiao-nan-gua-kong-jian-huan-shi-jian-by-9kjta/)
- [✅腾讯&leetcode15：三数之和](https://leetcode-cn.com/problems/3sum/solution/xiao-nan-gua-pai-xu-shuang-zhi-zhen-by-h-i03k/)
- [✅leetcode380：常数时间插入、删除和获取随机元素](https://leetcode-cn.com/problems/insert-delete-getrandom-o1/solution/chang-shu-shi-jian-cha-ru-shan-chu-he-huo-qu-sui-j/)
- [✅剑指Offer50：第一个只出现一次的字符](https://leetcode-cn.com/problems/di-yi-ge-zhi-chu-xian-yi-ci-de-zi-fu-lcof/solution/xiao-nan-gua-ha-xi-biao-by-happydemoney-h6z6/)

#### 二叉树

##### 二叉树的遍历
- [✅字节&leetcode144：二叉树的前序遍历](https://leetcode-cn.com/problems/binary-tree-preorder-traversal/solution/xiao-nan-gua-di-gui-jie-jue-qian-zhong-h-lwxw/)
- [✅字节&leetcode94：二叉树的中序遍历](https://leetcode-cn.com/problems/binary-tree-preorder-traversal/solution/xiao-nan-gua-di-gui-jie-jue-qian-zhong-h-lwxw/)
- [✅字节&leetcode145：二叉树的后序遍历](https://leetcode-cn.com/problems/binary-tree-preorder-traversal/solution/xiao-nan-gua-di-gui-jie-jue-qian-zhong-h-lwxw/)
- [✅leetcode102：二叉树的层序遍历](https://leetcode-cn.com/problems/binary-tree-level-order-traversal/solution/xiao-nan-gua-bfs-by-happydemoney-kgdd/)
- [✅l字节&leetcode107：二叉树的层次遍历](https://leetcode-cn.com/problems/binary-tree-level-order-traversal-ii/solution/xiao-nan-gua-bfszhan-by-happydemoney-e7tg/)

##### 重构二叉树
- [✅leetcode105：从前序与中序遍历序列构造二叉树](https://leetcode-cn.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/solution/xiao-nan-gua-di-gui-by-happydemoney-7jkz/)

##### 二叉树进阶
- [✅l腾讯&leetcode104：二叉树的最大深度](https://leetcode-cn.com/problems/maximum-depth-of-binary-tree/solution/xiao-nan-gua-bfs-by-happydemoney-xlgv/)
- [✅字节&腾讯leetcode236：二叉树的最近公共祖先](https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-tree/solution/xiao-nan-gua-hou-xu-bian-li-by-happydemo-xa1z/)
- [✅剑指Offer&leetcode110：平衡二叉树](https://leetcode-cn.com/problems/balanced-binary-tree/solution/xiao-nan-gua-hou-xu-bian-li-by-happydemo-y9aj/)
- [✅字节&leetcode112：路径总和](https://leetcode-cn.com/problems/path-sum/solution/xiao-nan-gua-qian-xu-bian-li-by-happydem-6brs/)
- [✅剑指Offer&leetcode101：对称二叉树](https://leetcode-cn.com/problems/symmetric-tree/solution/xiao-nan-gua-di-gui-by-happydemoney-45at/)
- [字节一面：给定一个二叉树, 找到该树中两个指定节点间的最短距离](https://github.com/sisterAn/JavaScript-Algorithms/issues/82)
- [✅腾讯&leetcode230：二叉搜索树中第K小的元素](https://leetcode-cn.com/problems/kth-smallest-element-in-a-bst/solution/xiao-nan-gua-dfs-by-happydemoney-x8t7/)
- [二叉树的左右子树交换](https://github.com/sisterAn/JavaScript-Algorithms/issues/141)

#### 堆
- [腾讯&字节等：最小的k个数](https://github.com/sisterAn/JavaScript-Algorithms/issues/59)
- [leetcode347：前 K 个高频元素](https://github.com/sisterAn/JavaScript-Algorithms/issues/61)
- [字节&leetcode215：数组中的第K个最大元素](https://github.com/sisterAn/JavaScript-Algorithms/issues/62)
- [剑指Offer&leetcode295：数据流的中位数](https://github.com/sisterAn/JavaScript-Algorithms/issues/63)

#### 图
- [leetcode997：找到小镇的法官](https://github.com/sisterAn/JavaScript-Algorithms/issues/65)
- [leetcode207：课程表问题](https://github.com/sisterAn/JavaScript-Algorithms/issues/66)
- [剑指Offer&Bigo：旋转矩阵](https://github.com/sisterAn/JavaScript-Algorithms/issues/57)
- [腾讯&leetcode：螺旋矩阵 II](https://github.com/sisterAn/JavaScript-Algorithms/issues/134)

###  算法技巧

#### 排序算法
- [腾讯&字节：介绍一下快排原理以及时间复杂度，并实现一个快排](https://github.com/sisterAn/JavaScript-Algorithms/issues/70)
- [字节&阿里&网易&leetcode384：打乱数组（洗牌算法）](https://github.com/sisterAn/JavaScript-Algorithms/issues/74)
- [阿里五面：说下希尔排序的过程？ 希尔排序的时间复杂度和空间复杂度又是多少？](https://github.com/sisterAn/JavaScript-Algorithms/issues/75)
- [腾讯&leetcode148：排序链表](https://github.com/sisterAn/JavaScript-Algorithms/issues/79)
- [字节算法题：扑克牌问题（反向推导题）](https://github.com/sisterAn/JavaScript-Algorithms/issues/80)
- [腾讯&leetcode611：有效三角形的个数](https://github.com/sisterAn/JavaScript-Algorithms/issues/93)

#### 查找算法
- [✅腾讯：简述二分查找算法与时间复杂度，并实现一个二分查找算法](https://leetcode-cn.com/problems/binary-search/solution/er-fen-cha-zhao-by-leetcode-solution-f0xw/)
- [✅腾讯&字节&leetcode34：在排序数组中查找元素的第一个和最后一个位置](https://labuladong.gitee.io/algo/1/9/)
- [腾讯&leetcode230：二叉搜索树中第K小的元素](https://github.com/sisterAn/JavaScript-Algorithms/issues/86)
- [腾讯&leetcode875：爱吃香蕉的珂珂](https://github.com/sisterAn/JavaScript-Algorithms/issues/109)

#### 动态规划
- [✅字节&leetcode70：爬楼梯问题](https://leetcode-cn.com/problems/climbing-stairs/solution/xiao-nan-gua-jian-dan-di-gui-by-happydem-ribe/)
- [字节&leetcode746：使用最小花费爬楼梯](https://github.com/sisterAn/JavaScript-Algorithms/issues/91)
- [字节二面&leetcode53：最大子序和](https://github.com/sisterAn/JavaScript-Algorithms/issues/94)
- [✅腾讯&leetcode121：买卖股票的最佳时机](https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock/solution/xiao-dong-tai-gui-hua-by-happydemoney-rfwv/)
- [腾讯&leetcode647：回文子串](https://github.com/sisterAn/JavaScript-Algorithms/issues/107)
- [腾讯&leetcode5：最长回文子串](https://github.com/sisterAn/JavaScript-Algorithms/issues/121)
- [阿里&网易&leetcode64：最小路径和](https://github.com/sisterAn/JavaScript-Algorithms/issues/139)

#### 贪心算法
- [✅字节&leetcode122：买卖股票的最佳时机 II](https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock-ii/solution/xiao-tan-xin-by-happydemoney-mafm/)
- [✅字节&leetcode455：分发饼干](https://leetcode-cn.com/problems/assign-cookies/solution/xiao-shuang-zhi-zhen-by-happydemoney-rmza/)
- [✅腾讯&leetcode659：分割数组为连续子序列](https://leetcode-cn.com/problems/split-array-into-consecutive-subsequences/solution/fen-ge-shu-zu-wei-lian-xu-zi-xu-lie-by-l-lbs5/)

#### 回溯算法
- [✅百度&leetcode46：全排列问题](https://leetcode-cn.com/problems/permutations/solution/xiao-hui-su-fa-by-happydemoney-1hi0/)
- [✅腾讯&leetcode22：括号生成](https://leetcode-cn.com/problems/generate-parentheses/solution/gua-hao-sheng-cheng-by-leetcode-solution/)

### 设计

- [✅华为&leetcode146：设计和实现一个LRU（最近最少使用）缓存机制](https://leetcode-cn.com/problems/lru-cache/solution/xiao-nan-gua-shuang-xiang-lian-biao-ji-m-q7rt/)
- [✅leetcode297. 二叉树的序列化与反序列化](https://leetcode-cn.com/problems/serialize-and-deserialize-binary-tree/solution/er-cha-shu-de-xu-lie-hua-yu-fan-xu-lie-hua-by-le-2/)
