#!/bin/bash
#
# https://github.com/xinlingduyu/build-openwrt
#

# 清除旧镜像（修复报错：无镜像时不执行）
if [ -n "$(docker images -q)" ]; then
    docker rmi $(docker images -q)
fi

# 清理系统空间
df -h
