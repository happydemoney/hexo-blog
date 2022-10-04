# 基于hexo建的个人博客

[ ![showUrl](https://img.shields.io/badge/%E6%BC%94%E7%A4%BA%E5%9C%B0%E5%9D%80-v0.1.0-orange.svg)](https://happydemoney.github.io/hexo-blog)

##  项目初始化

```js
// 依赖安装 - 如果没有全局安装yarn,可以使用npm install命令
yarn install
// 本地调试
yarn server
```

##  如何添加一篇博客

往./source/_posts/目录下新建一个markdown文档即可

```js
// ./source/_posts/helloworld.md
---
title: 第一篇博客
index_img: /img/reduce.webp
---

##  Hello word

这是一篇测试博客
```

##  发布博客

```js
yarn deploy
```

这里修改了deploy默认的命令，跑了自定义的脚本

```sh
# github\hexo-blogs\_scripts\deploy.sh
# 清理已生产的静态资源文件
yarn clean
# 打包静态资源文件
yarn build
# 为避免git chckout报错，先提交master分支
git add .
git commit -m '新增一篇博客'
git push
# 切换到gh-pages分支
git checkout gh-pages
# 清理docs目录文件
rm -rf ./docs
# 复制public目录文件到docs
cp -r ./public ./docs
# 压缩静态资源目录
# tar -czf docs.tar.gz ./docs
# 添加docs部分代码
git add ./docs
# 提交添加部分的代码
git commit -m '更新docs目录'
# 推送到远端
git push
# 解压压缩好的静态资源文件
#tar -xzf docs.tar.gz -C ./public2
git checkout master
```