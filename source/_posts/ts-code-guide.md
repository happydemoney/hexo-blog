---
title: 【TS】TypeScript编码规范
index_img: /img/typescript.webp
---

[TOC]

# TypeScript编码规范

##  前言

随着 TypeScript 的不断发展，越来越多的开发者认可并使用 TypeScript 开发应用。本文档的目标是使 TypeScript 新特性的代码风格保持一致，并给予一些实践*建议*。

由于 TypeScript 依然在快速发展，本文档也将随时保持更新。更新内容主要涉及对新增的语言特性的格式规范化、实践指导，引擎与编译器环境变化的使用指导。

##  代码风格

### 2.1 环境

[**强制**] TypeScript 文件使用 .ts 扩展名。含 JSX 语法的 TypeScript 文件使用 .tsx 扩展名。
[*建议*] tsconfig.json 配置文件应开启 strict、noImplicitReturns、noUnusedLocals 选项。
[*建议*] tsconfig.json 配置文件应开启 allowSyntheticDefaultImports 选项。
示例：
```ts
// good
import React, { PureComponent } from 'react';

// bad
import * as React from 'react';
```
[*建议*] 使用 VS Code 编写 TypeScript。

### 2.2 文件

[**强制**] 在文件结尾处，保留一个空行。

### 2.3 命名

[**强制**] 接口 使用 Pascal 命名法。
[**强制**] 接口名 不使用 I 作为前缀。
示例：
```ts
// good
interface ButtonProps {
    // ...
}

// bad
interface IButtonProps {
    // ...
}
```
[**强制**] 类型别名 使用 Pascal 命名法。
示例：
```ts
// good
interface HeaderStateProps {
    // ...
}

interface HeaderDispatchProps {
    // ...
}

type HeaderProps = HeaderStateProps & HeaderDispatchProps;
```

```
1. 使用PascalCase为类型命名。
2. 不要使用`I`做为接口名前缀。
3. 使用PascalCase为枚举值命名。
4. 使用camelCase为函数命名。
5. 使用camelCase为属性或本地变量命名。
6. 不要为私有属性名添加`_`前缀。
7. 尽可能使用完整的单词拼写命名。
```

##  语言特性

### 3.1 变量
[**强制**] 使用 const 声明 枚举 。
示例：
```ts
// good
const enum Directions {
    UP,
    DOWM,
    LEFT,
    RIGHT,
}

// bad
enum Directions {
    UP,
    DOWN,
    LEFT,
    RIGHT,
}
```
### 3.2 类型
[**强制**] 不应显式声明可以自动推导的类型。
示例：
```ts
// good
let shouldUpdate = false;

// bad
let shouldUpdate: boolean = false;
```
[**强制**] 使用 string / number / boolean 声明基本类型，不使用 String / Number / Boolean。
示例：
```ts
// good
let str: string;

// bad
let str: String;
```
[**强制**] 不使用 Object / Function 声明类型。
[**强制**] 数组元素为简单类型（非匿名且不含泛型）时，使用 T[] 声明类型，否则应使用 Array<T>。
[*建议*] 数组元素为不可变数据时，使用 ReadonlyArray<T> 声明类型。
示例：
```ts
// good
let files: string[];
let tokens: Array<string | number>;
let buffer: Buffer[];
let responses: Array<Promise<number>>;

// bad
let files: Array<string>;
let tokens: (string | number)[];
let buffer: Array<Buffer>;
let responses: Promise<number>[];
```
[**强制**] 不使用 ! 声明对象属性非空。
示例：
```ts
// good
if (foo.bar && foo.bar.baz) {
    // ...
}

// bad
if (foo!.bar!.baz) {
    // ...
}
```
[*建议*] 不使用 any 声明类型。
示例：
```ts
// good
const identity = <T>(x: T) => x;

// bad
const identity = (x: any) => x;
```
[**强制**] 使用 as 进行类型声明转换，不使用 <> 。
示例：
```ts
// good
const root = document.getElementById('root') as HTMLDivElement;

// bad
const root = <HTMLDivElement>document.getElementById('root');
```
[**强制**] 接口不应为空。
[**强制**] 接口中同一函数重载的类型声明需相邻。
示例：
```ts
// good
interface AnyInterface {
    foo();
    foo(x: string);
    bar();
    bar(x: number);
}

// bad
interface AnyInterface {
    foo();
    bar();
    foo(x: string);
    bar(x: number);
}
```
[*建议*] 不要导出类型/函数，除非你要在不同的组件中共享它。
[*建议*] 不要在全局命名空间内定义类型/值。
[*建议*] 共享的类型应该在`types.ts`里定义。
[*建议*] 在一个文件里，类型定义应该出现在顶部。

### 3.3 条件
[**强制**] 使用 === 或 !== 判断相等性，不使用 == 或 !=。
示例：
```ts
// good
if (foo !== null && foo !== undefined) {
    // ...
}

// bad
if (foo != null) {
    // ...
}
```

### 3.4 循环
[*建议*] 使用 Object.keys / Object.values / Object.entries / Object.getOwnPropertyNames 遍历对象，不使用 for .. in 。
示例：
```ts
// good
Object.keys(obj).forEach(key => /* ... */);

// bad
for (const key in obj) {
    if (obj.hasOwnProperty(key)) {
        // ...
    }
}
```
[*建议*] 索引仅用于获取数组当前被迭代的项时，使用 for .. of 遍历数组，不使用 for 。
示例：
```ts
// good
for (const item of items) {
    // ...
}

// bad
for (let i = 0; i < items.length; i++) {
    const item = items[i];
    // ...
}
```
### 3.5 数组
[*建议*] 使用 ... 进行数组浅拷贝，不使用 Array.from / Array.prototype.slice 。
示例：
```ts
// good
const copies = [...items];

// bad
const copies = items.slice();

// worst
let copies = [];
for (let i = 0; i < items.length; i++) {
    copies.push(items[i]);
}
```
[*建议*] 使用 ... 将类数组对象转化为数组，不使用 Array.from / Array.prototype.slice 。
示例：
```ts
// good
const elements = [...document.querySelectorAll('.foo')];

// bad
const element = Array.from(document.querySelectorAll('.foo'));

// worst
const element = Array.prototype.slice.call(document.querySelectorAll('.foo'));
```
### 3.6 对象
[**强制**] 使用 ... 进行对象浅拷贝，不使用 Object.assign 。
示例：
```jsx
// good
this.setState(state => ({...state, clicked: true}));

// bad
this.setState(state => Object.assign({}, state, {clicked: true}));
```
### 3.7 函数
[**强制**] 避免 return undefined ，应直接 return。
示例：
```ts
// good
function foo(bar: boolean) {
    if (!bar) {
        return;
    }
}

// bad
function foo(bar: boolean) {
    if (!bar) {
        return undefined;
    }
}
```
### 3.8 类
[*建议*] 每个文件中最多声明一个类。
[**强制**] 类成员的可访问性为 public 时，不应显式声明。
[*建议*] 构造函数可忽略时，应忽略。
[*建议*] 类成员之间使用空行隔开。
示例：
```ts
// good
class Button extends PureComponent<ButtonProps, ButtonState> {
    readonly state: ButtonState = {
        clicked: false,
    };

    render() {
        // ...
    }
}

// bad
class Button extends PureComponent<ButtonProps, ButtonState> {
    public state: ButtonState = {
        clicked: false,
    };
    constructor(props: ButtonProps) {
        super(props);
    }
    public render() {
        // ...
    }
}
```
[*建议*] 构造函数初始化实例属性时，应尽量使用参数属性。
[*建议*] 构造函数的参数中，作为属性的参数应排列于其他参数前。
示例：
```ts
// good
class AppComponent {
    constructor(private readonly heroService: HeroService) {}
}

// bad
class AppComponent {
    private readonly heroService: HeroService;

    constructor(heroService: HeroService) {
        this.heroService = heroService;
    }
}
```
### 3.9 模块
[**强制**] 使用 ECMAScript 2015 标准的模块系统。
[**强制**] 除类型声明文件外，不使用 module / namespace 关键字。
[**强制**] 不使用 /// <reference path= > 。
示例：
```ts
// good
import foo from 'foo';

// bad
import foo = require('foo');
```
[**强制**] 对于同一个模块路径，仅 import 一次。
示例：
```ts
// good
import React, {PureComponent} from 'react';

// bad
import React from 'react';
import {PureComponent} from 'react';
```
[*建议*] 对于使用 webpack 等构建工具的项目，在模块中引入其他资源（如样式、图片等）时，为资源编写类型声明文件，或使用合适的 loader 生成类型声明文件。
示例：
```ts
// good

// Button.scss.d.ts
export clicked: string;

// logo.png.d.ts
declare const logo: string;

export default logo;

// Button.tsx
import styles from './Button.scss';
import logo from './logo.png';


// bad
const styles = require<any>('./Button.scss');
const logo = require<string>('./logo.png');
```

### 3.10 字符串

[**强制**] 使用双引号`""`
[*建议*] 所有要展示给用户看的信息字符串都要做好本地化工作（在diagnosticMessages.json中创建新的实体）。

##  其他

### 4.1 注释

[*建议*] 为函数，接口，枚举类型和类使用JSDoc风格的注释。

```ts
// good
/**
 * 创建一个websocket
 * @param {string | URL} url
 * @param {string | string[]} protocols
 * @returns {WebSocket} 返回websocket实例
 */
function createWebSocket (url, protocols) {
  // code here
}

// bad
function createWebSocket (url, protocols) {
  // code here
}
```

### 4.2 错误提示信息

1. 在句子结尾使用`.`。
2. 对不确定的实体使用不定冠词。
3. 确切的实体应该使用名字（变量名，类型名等）
4. 当创建一条新的规则时，主题应该使用单数形式（比如：An external module cannot...而不是External modules cannot）。
5. 使用现在时态。

### 4.3 错误提示信息代码

提示信息被划分类成了一般的区间。如果要新加一个提示信息，在上条代码上加1做为新的代码。

* 1000 语法信息
* 2000 语言信息
* 4000 声明生成信息
* 5000 编译器选项信息
* 6000 命令行编译器信息
* 7000 noImplicitAny信息

### 4.4 普通方法

由于种种原因，我们避免使用一些方法，而使用我们自己定义的。

1. 不使用ECMAScript 5函数；而是使用[core.ts](https://github.com/Microsoft/TypeScript/blob/master/src/compiler/core.ts)这里的。
2. 不要使用`for..in`语句；而是使用`ts.forEach`，`ts.forEachKey`和`ts.forEachValue`。注意它们之间的区别。
3. 如果可能的话，尝试使用`ts.forEach`，`ts.map`和`ts.filter`代替循环。

### 4.5 风格

1. 使用arrow函数代替匿名函数表达式。
2. 只要需要的时候才把arrow函数的参数括起来。 比如，`(x) => x + x`是错误的，下面是正确的做法：
   1. `x => x + x`
   2. `(x,y) => x + y`
   3. `<T>(x: T, y: T) => x === y`
3. 总是使用`{}`把循环体和条件语句括起来。
4. 开始的`{`总是在同一行。
5. 小括号里开始不要有空白.  逗号，冒号，分号后要有一个空格。比如：
   1. `for (var i = 0, n = str.length; i < 10; i++) { }`
   2. `if (x < 10) { }`
   3. `function f(x: number, y: string): void { }`
6. 每个变量声明语句只声明一个变量  （比如 使用 `var x = 1; var y = 2;` 而不是 `var x = 1, y = 2;`）。
7. `else`要在结束的`}`后另起一行。

