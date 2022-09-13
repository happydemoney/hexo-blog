---
title: 【webpack】打包一个vue应用
---
Tag: `学习` `webapck`

打包一个vue应用最方便的还是使用官方提供的vue-cli应用，但是，从长远来说，这不利于我们自身的成长；
所以让我们暂时忘却vue-cli，基于webpack，从头一点一点去整合出一个webpack打包配置来；

##  目标

- 打包一个vue应用，可本地运行调试，可打线上包

##  前期准备

### 学习资料

[深入浅出webpack](http://webpack.wuhaolin.cn/)

[webpack中文文档](https://webpack.docschina.org/concepts/)

###  webpack核心概念

- Entry：入口，Webpack 执行构建的第一步将从 Entry 开始，可抽象成输入。
- Module：模块，在 Webpack 里一切皆模块，一个模块对应着一个文件。Webpack 会从配置的 Entry 开始递归找出所有依赖的模块。
- Chunk：代码块，一个 Chunk 由多个模块组合而成，用于代码合并与分割。
- Loader：模块转换器，用于把模块原内容按照需求转换成新内容。
- Plugin：扩展插件，在 Webpack 构建流程中的特定时机注入扩展逻辑来改变构建结果或做你想要的事情。
- Output：输出结果，在 Webpack 经过一系列处理并得出最终想要的代码后输出结果。

### 运行环境

[node-v16.9.1](https://nodejs.org/zh-cn/)
[vue-cli(用于生成一个vue基本工程)](https://cli.vuejs.org/zh/guide/installation.html)

依赖版本相关
"webpack": "^5.64.1",
"webpack-cli": "^4.9.1",

### 技术选型

- 开发语言 ( JS (ES5/ES6+) or TS )

  使用ES6，借助Babel

- css预处理器 ( Less (.less) | Sass (.scss/.sass) | Stylus(.stylus/.styl) | Postcss )

  使用Less

### 一个空vue工程

```js
// 验证cli是否安装成功
vue -V // 3.5.1

// Mac/linux系统
vue create webpack-practice
// Windows系统
winpty vue.cmd create webpack-practice

// 选择default(babel, eslint)
cd webpack-practice
npm run serve

/**
 *  DONE  Compiled successfully in 3542ms 
 * 
 * App running at:
  - Local:   http://localhost:8080/ 
  - Network: http://x.x.x.x:8080/
  Note that the development build is not optimized.
  To create a production build, run npm run build.
 * /
// 出现以上字样表示空工程已就绪
```

一切准备就绪，下面开始进入正题

##  基础依赖及配置

```js
npm i webpack webpack-cli -D
```

```js
// package.json - add npm script
"scripts": {
  "start": "webpack",
  "serve:webpack": "webpack serve",
  "build:webpack": "webpack --mode production"
},
```

```js
// 根目录 - ./webpack.config.js
/**
 * webapck配置总入口
 * 将配置分成三份，common/dev/prod
 */
const merge = require('webpack-merge');
const commonConfig = require('./build/webpack-common.config.js');
const developmentConfig = require('./build/webpack-dev.config.js');
const productionConfig = require('./build/webpack-prod.config.js');

module.exports = (env, args) => {
  if (args.mode === 'production') {
    return merge(commonConfig, productionConfig);
  } else {
    return merge(commonConfig, developmentConfig);
  }
};
```

```js
// build目录 - ./build/webpack-common.config.js
/**
 * webapck配置文档
 * docs: https://webpack.docschina.org/concepts/
 */
const path = require('path');

function resolve (dir) {
  return path.join(__dirname, '..', dir)
}

module.exports = {
  /**
   * 入口(entry)
   * 入口起点(entry point) 指示 webpack 应该使用哪个模块，来作为构建其内部 依赖图(dependency graph) 的开始。进入入口起点后，webpack 会找出有哪些模块和库是入口起点（直接和间接）依赖的。
   * 默认值是 ./src/index.js
   */
  entry: './src/main.js',
  /**
   * 输出(output)
   * output 属性告诉 webpack 在哪里输出它所创建的 bundle，以及如何命名这些文件。主要输出文件的默认值是 ./dist/main.js，其他生成文件默认放置在 ./dist 文件夹中。
   */
   output: {
    path: resolve('/dist'), // 需要绝对路径
    filename: '[name].js',
    publicPath: '/'
  },
}
```

```js
// build目录 - ./build/webpack-dev.config.js
/**
 * 开发环境webpack配置
 */
module.exports = {
  mode: 'development',
}
```

```js
// build目录 - ./build/webpack-prod.config.js
/**
 * 生产环境webpack配置
 */
module.exports = {
  mode: 'production',
}
```

至此webpack相关基本配置已完成

开始执行打包命令：

```js
npm run start
/**
 * 
 * ERROR in ./src/App.vue 1:0
Module parse failed: Unexpected token (1:0)
You may need an appropriate loader to handle this file type, currently no loaders are configured to process this file. See https://webpack.js.org/concepts#loaders
> <template>
|   <div id="app">
|     <img alt="Vue logo" src="./assets/logo.png">
 @ ./src/main.js 2:0-27 7:17-20
 *
 * /
```

报错了，大概意思是.vue文件它不能识别，需要借助相关loader处理

##  loader配置

### vue-loader

[vue-loader](https://vue-loader.vuejs.org/zh/)

```js
// vue-loader因为已经通过cli安装了，所以不需要再安装了

// ./build/webpack-common.config.js - 更新配置
const { VueLoaderPlugin } = require('vue-loader')

module.exports = {
  module: {
    rules: [
      // ... 其它规则
      {
        test: /\.vue$/,
        loader: 'vue-loader'
      }
    ]
  },
  plugins: [
    // 请确保引入这个插件！
    new VueLoaderPlugin()
  ]
}

// 再次执行打包命令
npm run start
/**
 * 
 * ERROR in ./src/App.vue?vue&type=style&index=0&lang=css& (./node_modules/vue-loader/lib??vue-loader-options!./src/App.vue?vue&type=style&index=0&lang=css&) 20:0
Module parse failed: Unexpected character '#' (20:0)
File was processed with these loaders:
 * ./node_modules/vue-loader/lib/index.js
You may need an additional loader to handle the result of these loaders.
| 
| 
> #app {
*/
```

又报错了，这次是识别不了图片和css样式，得，继续配置loader

###  css-loader / url-loader

```js
// css-loader因为已经通过cli安装了，所以不需要再安装了

// ./build/webpack-common.config.js - 更新配置
module.exports = {
  module: {
    rules: [
      // 其他loader
      {
        test: /\.css$/,
        use: ['vue-style-loader', 'css-loader']
      },
      {
        test: /\.png$/,
        loader: 'url-loader',
      }
    ]
  },
}

// 再次执行打包命令
npm run start

// nice 打包成功
```

####  说明

- css-loader 会找出 CSS 代码中的 @import 和 url() 这样的导入语句，告诉 Webpack 依赖这些资源。同时还支持 CSS Modules、压缩 CSS 等功能。处理完后再把结果交给 style-loader 去处理。

- style-loader 会把 CSS 代码转换成字符串后，注入到 JavaScript 代码中去，通过 JavaScript 去给 DOM 增加样式。

这里使用的vue-style-loader是fork了style-loader的源代码，对vue文件做了一些定制化处理。

##  总结

- 熟悉并实践了一下webpack的基本配置
- 使用vue-loader加载.vue单文件
- 使用css-loader/vue-style-loader加载.css文件
- 使用url-loader加载图片资源文件

其他未解决问题（后续再更新）：

- css预处理文件处理 ，比如less (less-loader)
- ES6转ES5语法 (babel-loader)
- 本地运行一个服务并支持热更新 (wepack-dev-server)
- 字体等文件的加载 (url-loader)
- 视频等文件的加载 (url-loader)
- 其他实用的功能（比如vue支持jsx的写法）
- 线上打包的优化等等
