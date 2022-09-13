---
title: 【实现API】数组reduce方法的实现
---
[MDN-Array.prototype.reduce](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Array/Reduce)

##	介绍

reduce() 方法对数组中的每个元素按序执行一个由您提供的 reducer 函数，每一次运行 reducer 会将先前元素的计算结果作为参数传入，最后将其结果汇总为单个返回值。

第一次执行回调函数时，不存在“上一次的计算结果”。如果需要回调函数从数组索引为 0 的元素开始执行，则需要传递初始值。否则，数组索引为 0 的元素将被作为初始值 initialValue，迭代器将从第二个元素开始执行（索引为 1 而不是 0）。

##	用法

```js
const array1 = [1, 2, 3, 4];

// 0 + 1 + 2 + 3 + 4
const initialValue = 0;
const sumWithInitial = array1.reduce(
  (previousValue, currentValue) => previousValue + currentValue,
  initialValue
);

console.log(sumWithInitial);
// expected output: 10
```

##	实现

```js
Array.prototype.reduceFn = function (reducer/*, initValue*/) {
  // reducer必须是一个函数
  if (typeof reducer !== 'function') {
    throw new TypeError(`${reducer} is not a function.`);
  }
  // 是否包含初始值
  const hasInitValue = arguments.length > 1;
  // 当前遍历的数组
  const array = Object(this);
  const length = array.length;
  // 数组长度要大于0或包含初始值
  if (length === 0 && !hasInitValue) {
    throw new TypeError('Reduce of empty array with no initial value');
  }
  // 上一次调用 reducer 时的返回值, 此处为初始值赋值
  let previousValue = hasInitValue ? arguments[1] : array[0];
  // 数组中正在处理的元素的索引
  let currentIndex = hasInitValue ? 0 : 1;
  while (currentIndex < length) {
    previousValue = reducer(previousValue, array[currentIndex], currentIndex, array);
    currentIndex ++;
  }
  return previousValue;
};

// test
[1, 2, 3, 4, 5].reduceFn((prev, cur) => prev + cur); // 15
[1, 2, 3, 4, 5].reduceFn((prev, cur) => prev + cur, 10); // 25
```