---
title: 【算法】机试算法-数独算法变种
index_img: /img/keyboard-number.webp
---

[Sudoku-数独问题](https://www.nowcoder.com/practice/78a1a4ebe8a34c93aac006c44f6bf8a1?tpId=37&tqId=21267&rp=1&ru=/exam/oj/ta&qru=/exam/oj/ta&sourceUrl=%2Fexam%2Foj%2Fta%3FtpId%3D37&difficulty=undefined&judgeStatus=undefined&tags=&title=)

##  描述

问题描述：给你一个大写单词word，在这样一个遍布着大写的字母(A-Z)的矩阵(n(行) x m(列))中，如果你可以通过上、下、左、右的方向去找到连续的字母组成word，则输出word的的字母的坐标（行列从1开始计算），如果遍历了矩阵所有位置都找不到，则输出NO；

示例：

```js
/**
 * 输入
 * 首行为标识矩阵的行(n)、列数(m)，比如这个是4x5的矩阵
 * 第2行为目标单词word
 * 从第3行到第n+2行为矩阵内的字母
 */
`4 5
HELLO
ABCDE
HDFGA
ELRTY
ALOGH`

// 输出
3 1 // H(3 1) - E(4 1) - L(4 2) - L(5 2) - O(5 3)
```

##  思路分析

- 第一步，把输入的矩阵数据转换成一个二维数组 board
- 以从左到右，从上到下的顺序遍历每一个字母
- 当找到word的首字母，将step加1，并记录此时board下标数据和result((i+1) + ' ' + (j+1))
- 同时在当前字母位置的上、下、左、右四个方向上尝试下一个，同时继续遍历下一个
- 如果没找到，遍历下一个，同时为了防止无限循环，对于有标识result的，return掉
- 一直到遍历完所有字母

##  代码实现

```js
/**
 * 遍历函数
 * @param {*} board n x m的二维数组矩阵
 * @param {*} i 遍历到第几行
 * @param {*} j 遍历到第几列
 * @param {*} step 遍历到word的第几步
 * @param {*} result 满足条件board下标数据，word[0] === board[i][j]
 * @returns 
 */
function sudoku(input) {
  const inputArr = input.split('\n');
  const [n, m] = inputArr.shift().split(' '); // 首行为标识矩阵的行(n)、列数(m)，比如这个是4x5的矩阵
  const word = inputArr.shift().trim(); // 第2行为目标单词word
  const board = inputArr.map(item => item.split(''));
  let output = 'NO';

  const backtrack = (board, i, j, step = 0, result = '') => {
    // 遍历到行尾，往下一行遍历
    if (j === +m) {
      if (step !== 0) {
        return false;
      }
      return backtrack(board, i+1, 0, 0, '');
    }
    // 遍历完整个矩阵
    if (i === +n) {
      return true;
    }
    if (board[i][j] !== word[step]) {
      // 上一次满足条件此次不满足不在往下遍历
      if (result !== '' || step !== 0) { 
        return false;
      }
      return backtrack(board, i, j + 1, 0, '');
    } else {
      // 找到满足条件的
      if (step === 0) {
        result = (i+1) + ' ' + (j+1);
      }
      // 找到了整个word
      if (step === word.length - 1) {
        if (result) {
          output = result;
        }
        return true;
      }
      step++;
      // up - 向上找
      if (i - 1 >= 0 && board[i - 1][j] === word[step]) { 
        backtrack(board, i-1, j, step, result);
      }
      // down - 向下找
      if (i+1<+n && board[i+1][j] === word[step]) { 
        backtrack(board, i+1, j, step, result);
      }
      // left - 向左找
      if (j-1>=0 && board[i][j-1] === word[step]) { 
        backtrack(board, i, j-1, step, result);
      }
      // right - 向右找
      if (j+1<+m && board[i][j+1] === word[step]) { 
        backtrack(board, i, j+1, step, result);
      }
      step--;
      backtrack(board, i, j+1, step);
    }
    return false;
  };
  backtrack(board, 0, 0);
  console.log(output);
}

/**

 */
// test case -1
sudoku(`5 5
HELLO
OAIHL
HCDOL
ELLOW
OABRT
OABRH`);

// 2 1

// test case -2
sudoku(`4 5
HELLO
ABCHE
HDFGH
ELRTY
ALOGH`);

// 2 1
```