#!/bin/bash

# 请提前使用 gitbook install 安装依赖的 node 包。

# 脚本出错立即退出。
set -e

gitbook build

rm -rf docs

mv _book docs