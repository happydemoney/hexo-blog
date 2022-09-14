---
title: [解决方案]前端换肤方案
---

| 方法 | 特点 | 兼容性 | 推荐度 |
| ---- | ---- | ---- | ---- |
| 利用class 命名空间 | 最简单的换肤方案 |  |  |
| 准备多套CSS主题 | 最常用 |  | 推荐 |
| 动态换肤 | 支持浏览器热换肤，最酷炫 |  |  |
| less在线编译实现 | | | 不推荐 |
| CSS变量换肤 | 不考虑IE，最佳换肤方式 | 使用css-vars-ponyfill解决兼容性问题 | 推荐 |

##  利用class 命名空间

```html

<style>
.red-theme p {
  color: red
}

.blue-theme p {
  color: blue
｝
</style>

<body class="red-theme">
  <p> 这里是红色主题 </p>
  ...
</body>
```

## 准备多套CSS主题

```css
/*theme-default.css*/
p {
  color: #333
}
```

```css
/* theme-red.css */
p {
  color: #red
}
```

页面加载后，根据用户需求加载不同的样式列表
```html
<!DOCTYPE html>
<html lang="en">
<head>
  ...
  <link id="themeLink" type="text/css" rel="stylesheet" href="./css/multipleTheme/light.css" />
</head>
<body>
  <p>light主题显示蓝字，dark主题显示红字</p>
  <button onclick="changeTheme()">切换主题</button>
  <script>
    let currentTheme = 'light';

    function getTheme () {
      if (currentTheme === 'light') {
        currentTheme = 'dark';
      } else {
        currentTheme = 'light';
      }
      return currentTheme;
    }
    
    function changeTheme () {
      const ThemeMap = {
        'light': './css/multipleTheme/light.css',
        'dark': './css/multipleTheme/dark.css'
      };
      const themeLink = document.querySelector('#themeLink');
      themeLink.href = ThemeMap[getTheme()];
    }
  </script>
</body>
</html>
```

有时候需要保存用户使用的主题，可以通过如下方式：
```
利用路由标记
利用cookie标记
利用localstorage
保存到后端服务器
```

优化点：
利用CSS预处理生成多套主题样式

## 动态换肤

这是element ui中的换肤方案，支持浏览器热换肤。生成一套主题， 将主题配色配置写在js中，在浏览器中用js动态修改style标签覆盖原有的CSS。

1. 先把默认主题文件中涉及到颜色的 CSS 值替换成关键词
2. 根据用户选择的主题色生成一系列对应的颜色值
3. 把关键词再换回刚刚生成的相应的颜色值
4. 直接在页面上加 style 标签，把生成的样式填进去

### 先把默认主题文件中涉及到颜色的 CSS 值替换成关键词

```js
// https://github.com/ElementUI/theme-preview/blob/master/src/app.vue#L250-L274
getStyleTemplate(data) {
  const colorMap = {
    '#20a0ff': 'primary',
    '#0190fe': 'secondary',
    '#fbfdff': 'darkWhite',
    '#1f2d3d': 'baseBlack',
    '#324157': 'lightBlack',
    '#48576a': 'extraLightBlack',
    '#8391a5': 'baseSilver',
    '#97a8be': 'lightSilver',
    '#bfcbd9': 'extraLightSilver',
    '#d1dbe5': 'baseGray',
    '#e4e8f1': 'lightGray',
    '#eef1f6': 'extraLightGray',
    '#1d90e6': 'buttonActive',
    '#4db3ff': 'buttonHover',
    '#dfe6ec': 'tableBorder',
    '#d2ecff': 'datepickerInRange',
    '#afddff': 'datepickerInRangeHover',
    '#1c8de0': 'selectOptionSelected',
    '#edf7ff': 'lightBackground'
  };
  Object.keys(colorMap).forEach(key => {
    const value = colorMap[key];
    data = data.replace(new RegExp(key, 'ig'), value);
  });
  return data;
}
```

### 根据用户选择的主题色生成一系列对应的颜色值

```json
// https://github.com/ElementUI/theme-preview/blob/master/src/utils/formula.json
{
  "secondary": "color(primary s(99%) l(*0.9))",

  "darkWhite": "color(#fff blend(primary 2%))",

  "baseBlack": "color(primary h(+6) s(33%) l(18%))",
  "lightBlack": "color(baseBlack h(+5) s(27%) l(27%))",
  "extraLightBlack": "color(baseBlack h(+2) s(19%) l(35%))",
  "baseSilver": "color(baseBlack h(+3) s(16%) l(58%))",
  "lightSilver": "color(baseBlack h(+3) s(23%) l(67%))",
  "extraLightSilver": "color(baseBlack s(26%) l(80%))",
  "baseGray": "color(baseBlack s(28%) l(86%))",
  "lightGray": "color(baseBlack h(+10) s(33%) l(92%))",
  "extraLightGray": "color(baseBlack h(+6) s(33%) l(95%))",

  "buttonActive": "color(primary shade(10%))",
  "buttonHover": "color(primary tint(20%))",

  "tableBorder": "color(extraLightSilver h(-3) s(27%) l(90%))",

  "datepickerInRange": "color(primary tint(80%))",
  "datepickerInRangeHover": "color(primary tint(64%))",

  "selectOptionSelected": "color(primary shade(12%))",

  "lightBackground": "color(primary tint(92%))",
  "emptyText": "color(primary s(16%) l(44%))"
}
```

### 把关键词再换回刚刚生成的相应的颜色值

```js
// https://github.com/ElementUI/theme-preview/blob/master/src/utils/color.js
import color from 'css-color-function';
import formula from './formula.json';

const generateColors = primary => {
  let colors = {};
  let baseBlack = '';
  let extraLightBlack = '';
  let extraLightSilver = '';

  Object.keys(formula).forEach(key => {
    const value = formula[key]
      .replace(/primary/g, primary)
      .replace(/baseBlack/g, baseBlack)
      .replace(/extraLightBlack/g, extraLightBlack)
      .replace(/extraLightSilver/g, extraLightSilver);
    colors[key] = color.convert(value);
    if (key === 'baseBlack') {
      baseBlack = colors[key];
    }
    if (key === 'extraLightBlack') {
      extraLightBlack = colors[key];
    }
    if (key === 'extraLightSilver') {
      extraLightSilver = colors[key];
    }
  });
  return colors;
};

export default generateColors;
```

### 直接在页面上加 style 标签，把生成的样式填进去

```js
// https://github.com/ElementUI/theme-preview/blob/master/src/app.vue#L198-L211
writeNewStyle() {
  let cssText = this.originalStyle;
  Object.keys(this.colors).forEach(key => {
    cssText = cssText.replace(new RegExp('(:|\\s+)' + key, 'g'), '$1' + this.colors[key]);
  });
  if (this.originalStylesheetCount === document.styleSheets.length) {
    const style = document.createElement('style');
    style.innerText = cssText;
    document.head.appendChild(style);
  } else {
    document.head.lastChild.innerText = cssText;
  }
}
```

## less在线编译实现

不推荐

## CSS变量实现

[CSS Variables (Custom Properties)](https://caniuse.com/?search=css%20variables)

```css
/* variable.css */
/* 默认变量 */
:root {
  --primary: blue;
}

/* 亮色变量 */
[data-theme="light"] {
  --primary: green;
}

/* 深色变量 */
[data-theme="dark"] {
  --primary: red;
}
```

```html
<!DOCTYPE html>
<html lang="en" data-theme="default">
<head>
  ...
  <title>Css Variable</title>

  <link id="themeLink" type="text/css" rel="stylesheet" href="./css/cssVariable/variable.css" />
  <style>
    p {
      color: var(--primary);
    }
  </style>
</head>
<body>
  <p>默认主题为蓝色，light主题显示绿字，dark主题显示红字</p>
  <button onclick="changeTheme()">切换主题</button>
  <script>
    const themeList = ['default', 'light', 'dark'];
    let currentThemeIndex = 0;
    function changeTheme () {
      const htmlNode = document.querySelector('html');
      currentThemeIndex++;
      if (currentThemeIndex > themeList.length - 1) {
        currentThemeIndex = 0;
      }
      htmlNode.setAttribute('data-theme', themeList[currentThemeIndex]);
    }
  </script>
</body>
</html>
```

### css变量兼容方案

首先需要建一个存放公共css变量的js文件，将需要定义的css变量存放到该js文件，例如（variable.js）

```js
//浅色
export const lightTheme = { 
  '--primary': 'green'
};
// 深色
export const darkTheme = { 
  '--primary': 'red'
};
```

页面使用css变量，例如：
```html
<style lang="scss"> 
.text { 
  color: var(--primary);
}
</style>
```

安装css-vars-ponyfill 插件

「css-vars-ponyfill」 官方概念：在传统浏览器和现代浏览器中为CSS自定义属性(又名“CSS变量”)提供客户端支持的ponyfill。 （具体用法与概念请查阅官方网站：[css-vars-ponyfill](https://github.com/JofunLiang/vue-project-themable-demo)）

封装切换主题的js，在main.js做初始化调用

```js
// theme.js
import { lightTheme, darkTheme } from "../src/assets/js/variable";
import cssVars from "css-vars-ponyfill";

export const initTheme = (theme) => {
  document.documentElement.setAttribute("data-theme", theme ? "light" : "dark"); 
  cssVars({
    watch: true, // 当添加，删除或修改其<link>或<style>元素的禁用或href属性时，ponyfill将自行调用    
    variables: theme ? lightTheme : darkTheme, // variables 自定义属性名/值对的集合
    onlyLegacy: false, // false  默认将css变量编译为浏览器识别的css样式  true 当浏览器不支持css变量的时候将css变量编译为识别的css
  });
};
```
