#!/bin/bash

# 本脚本运行目录已经是 openwrt，无需 cd

# 多WAN自动登录（Zesuy）
git clone https://github.com/Zesuy/luci-app-multi-login package/luci-app-multi-login

# OpenClash
#git clone https://github.com/vernesong/OpenClash.git package/luci-app-openclash

# UA3F
git clone https://github.com/SunBK201/ua3f package/ua3f

# RKP-IPID 防检测
git clone https://github.com/CHN-beta/rkp-ipid package/rkp-ipid

# Argon 主题 + 配置
git clone https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
git clone https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config

#turboacc
git clone https://github.com/imapproxy/luci-app-turboacc package/luci-app-turboacc
