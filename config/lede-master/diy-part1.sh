#!/bin/bash

# 仅当存在镜像时才删除，避免空参数报错
imgs=$(docker images -q)
if [ -n "$imgs" ]; then
  docker rmi -f $imgs
fi

# 清理空间
sudo apt autoremove -y
sudo apt clean
