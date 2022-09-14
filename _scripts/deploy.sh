# 清理已生产的静态资源文件
yarn clean
# 打包静态资源文件
yarn build
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
