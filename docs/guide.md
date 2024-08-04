# 安装 Node.js

gitbook 基于 Node.js，所以需要先安装 Node.js 环境。

# 安装 gitbook-cli

npm install -g gitbook-cli@2.1.2

选项 -g 或 --global 表示全局模式，即将当前包安装为全局包。

指定版本的原因是最新版本 2.3.2 有 bug，在执行 gitbook install 时会报如下错误：
```
Installing GitBook 3.2.3
/opt/hostedtoolcache/node/12.22.12/x64/lib/node_modules/gitbook-cli/node_modules/npm/node_modules/graceful-fs/polyfills.js:287
      if (cb) cb.apply(this, arguments)
                 ^

TypeError: cb.apply is not a function
    at /opt/hostedtoolcache/node/12.22.12/x64/lib/node_modules/gitbook-cli/node_modules/npm/node_modules/graceful-fs/polyfills.js:287:18
    at FSReqCallback.oncomplete (fs.js:169:5)
```
# 安装依赖包

如果本地未安装依赖的 Node 包，需要先执行 gitbook install 安装依赖，会自动放到当前 node_modules 目录下。

# 发布到 Github

执行本地脚本 build.sh。

然后使用 git 将变更推送到远端仓库。

# 本地预览

执行 gitbook serve 进行本地预览。

自动构建发布，因为请参见 Github Action 脚本 .github/workflows/deploy.yml。