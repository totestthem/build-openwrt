#!/bin/bash
# 修复docker空镜像报错 专属适配雨夜模板
imgs=$(docker images -q)
if [ -n "$imgs" ]; then
  docker rmi -f $imgs
fi
# 空间清理
sudo apt autoremove -y >/dev/null 2>&1
sudo apt clean
