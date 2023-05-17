#!/bin/bash

# 脚本出错立即退出
set -e

gitbook build

rm -rf docs

mv _book docs