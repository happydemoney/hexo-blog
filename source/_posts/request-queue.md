---
title: 【实用功能】请求队列
---

[TOC]

##  背景

  某些页面的首屏请求会比较多，比如超过20多个，如果用户量大的情况下，会给服务器带来极大的压力，为了优化这种情况，服务端的开发同事建议前端能不能限制一下同时请求的数量，比如保持并行请求数量最大为6，当并发中的某个请求完成，执行请求队列的中的队头的请求，直到所有请求完成。

##  实现

### 请求队列类

```js
/**
 * 请求队列类
 */
class RequestQueue { 
  /**
   * @params {Array} requestList - 请求队列，先进先出
   * @params {Number} requestLimit - 最大请求并发数，默认为6
   */
  constructor(requestList  = [], requestLimit = 6) { 
    this.requestList = requestList;
    this.requestLimit = requestLimit;
  }
  /**
   * 执行请求的方法
   */
  run() {
    while (this.requestLimit && this.requestList.length) {
      const requestTask = this.requestList.shift();
      requestTask()
        .then(time => { 
          console.log('response success <-- request duration:', time);
        })
        .catch(error => { 
          console.log(error);
        })
        .finally(() => {
          this.requestLimit++;
          this.run();
        });
      this.requestLimit--;
    }
  }
}
```

### 构建请求函数

```js
function createRequest(time) {
  /**
   * 这里简单解释下为什么包一层function
   * 如果不包function的话，放到队列中请求就已经执行了
   * 达不到想要的效果
   */
  return function () {
    return new Promise((resolve, reject) => {
      console.log('start request --> response time:', time);
      try {
        setTimeout(() => { 
          resolve(time);
        }, time)
      } catch (error) { 
        reject(error);
      }
    });
  }
}
```

### Demo

```js
const requestTimeList = [
  1000, 2500, 3000,
  1500, 3500, 2000,
  1200, 4000, 800,
  500, 600, 1400,
  1600, 2400, 2200
];
function createRequest(time) {
  return function () {
    return new Promise((resolve, reject) => {
      console.log('start request --> response time:', time);
      try {
        setTimeout(() => { 
          resolve(time);
        }, time)
      } catch (error) { 
        reject(error);
      }
    });
  }
}
const requestQueueList = requestTimeList.map(item => createRequest(item));

class RequestQueue { 
  constructor(requestList  = [], requestLimit = 6) { 
    this.requestList = requestList;
    this.requestLimit = requestLimit;
  }
  run() { 
    while (this.requestLimit && this.requestList.length) {
      const requestTask = this.requestList.shift();
      requestTask()
        .then(time => { 
          console.log('response success <-- request duration:', time);
        })
        .catch(error => { 
          console.log(error);
        })
        .finally(() => {
          this.requestLimit++;
          this.run();
        });
      this.requestLimit--;
    }
  }
}

const requestQueue = new RequestQueue(requestQueueList, 6);
requestQueue.run();

// 输出示例
/*
// 首次执行run函数，发出6个并发请求
VM36:11 start request --> response time: 1000
VM36:11 start request --> response time: 2500
VM36:11 start request --> response time: 3000
VM36:11 start request --> response time: 1500
VM36:11 start request --> response time: 3500
VM36:11 start request --> response time: 2000

// 上述6个请求中，1000最短，所以最先返回结果
VM36:34 response success <-- request duration: 1000
// 并发数少一个，立马执行未执行队列中的新的请求
VM36:11 start request --> response time: 1200

VM36:34 response success <-- request duration: 1500
VM36:11 start request --> response time: 4000

VM36:34 response success <-- request duration: 2000
VM36:11 start request --> response time: 800

VM36:34 response success <-- request duration: 1200
VM36:11 start request --> response time: 500

VM36:34 response success <-- request duration: 2500
VM36:11 start request --> response time: 600

VM36:34 response success <-- request duration: 500
VM36:11 start request --> response time: 1400

VM36:34 response success <-- request duration: 800
VM36:11 start request --> response time: 1600

VM36:34 response success <-- request duration: 3000
VM36:11 start request --> response time: 2400

VM36:34 response success <-- request duration: 600
VM36:11 start request --> response time: 2200

VM36:34 response success <-- request duration: 3500
VM36:34 response success <-- request duration: 1400
VM36:34 response success <-- request duration: 1600
VM36:34 response success <-- request duration: 2200
VM36:34 response success <-- request duration: 2400
VM36:34 response success <-- request duration: 4000
**/
```
