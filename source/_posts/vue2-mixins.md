---
title: 【Vue】vue2的mixins相关问题
index_img: /img/vue-js.webp
---

## 页面导航
[问题描述](#问题描述) 
[参考文档](#参考文档)
[问题描述解析](#想问题描述解析)

##  问题描述

vue2中，假设有一个组件A，其中mixins了文件B和C，那么请问：

- 假设A的data中有一个myData的key，如果B和C中的data都有这个key，
  1. created生命周期中访问this.myData，输出哪个文件的值
  2. 如果把A组件内的myData这个key删掉，那么输出哪个文件的值

- 假设A、B、C都定义了created这个生命周期函数
  1. 生命周期函数是怎么执行的？
  2. 如果都执行，那么执行顺序是什么？
  3. 如果在C文件中在mixins引入B，这个时候生命周期怎么执行？

##  参考文档

如果对以上问题有疑惑，可以看看下面这篇文章，写的很清晰

[说说你对vue的mixin的理解，有什么应用场景？](https://vue3js.cn/interview/vue/mixin.html)

### 文档结论如下

vue2中mixin有四种策略：

1. 替换型策略有props、methods、inject、computed，就是将新的同名参数替代旧的参数
2. 合并型策略是data, 通过set方法进行合并和重新赋值
3. 队列型策略有生命周期函数和watch，原理是将函数存入一个数组，然后正序遍历依次执行
4. 叠加型有component、directives、filters，通过原型链进行层层的叠加

##  问题描述解析

简单分析下, 问题描述中有这样三个对象：
`componentA`, `mixinB`, `mixinC`

```js
// 1. 对于data
componentA.data = Object.assign(mixinB.data, mixinC.data, componentA.data);

// 2. 对于methods
componentA.methods = Object.assign({...mixinB.methods}, {...mixinC.methods}, {...componentA.methods});

// 3. 对于生命周期，比如created
componentA.created = () => [mixinB.created, mixinC.created, componentA.created].forEach(created => created());
```

### 问题描述解答

vue2中，假设有一个组件A，其中mixins了文件B和C，那么请问：

- 假设A的data中有一个myData的key，如果B和C中的data都有这个key，
  1. created生命周期中访问this.myData，输出哪个文件的值
    `输出当前组件的值`
  2. 如果把A组件内的myData这个key删掉，那么输出哪个文件的值
    `输出mixins数组最尾部那个mixin文件中的值，比如mixins:[B, C]，那么输出的就是C文件中的值`

- 假设A、B、C都定义了created这个生命周期函数
  1. 生命周期函数是怎么执行的？
    `全部都会执行，因为生命周期在mixin中会处理为队列，按顺序执行`
  2. 如果都执行，那么执行顺序是什么？
    `组件本身A --> mixin B --> mixin C`
  3. 如果在C文件中在mixins引入B，这个时候生命周期怎么执行？
    `组件本身A --> mixin B --> mixin C, mixin处理中做了去重`