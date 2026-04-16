#!/bin/bash
#========================================================================================================================
# https://github.com/ophub/amlogic-s9xxx-openwrt
# Description: Automatically Build OpenWrt for Amlogic s9xxx tv box
# Function: Diy script (After Update feeds, Modify the default IP, hostname, theme, add/remove software packages, etc.)
# Source code repository: https://github.com/coolsnowwolf/lede / Branch: master
#========================================================================================================================

# ------------------------------- Main source started -------------------------------
#
# Modify default theme（FROM uci-theme-bootstrap CHANGE TO luci-theme-argon）
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' ./feeds/luci/collections/luci/Makefile

# Add autocore support for armvirt
sed -i 's/TARGET_rockchip/TARGET_rockchip\|\|TARGET_armvirt/g' package/lean/autocore/Makefile

# Set etc/openwrt_release
sed -i "s|DISTRIB_REVISION='.*'|DISTRIB_REVISION='R$(date +%Y.%m.%d)'|g" package/lean/default-settings/files/zzz-default-settings
echo "DISTRIB_SOURCECODE='lede'" >>package/base-files/files/etc/openwrt_release

# Modify default IP（默认192.168.1.1，无需修改）
# sed -i 's/192.168.1.1/192.168.31.4/g' package/base-files/files/bin/config_generate

# Replace the default software source
# sed -i 's#openwrt.proxy.ustclug.org#mirrors.bfsu.edu.cn\\/openwrt#' package/lean/default-settings/files/zzz-default-settings
#
# ------------------------------- Main source ends -------------------------------

# ------------------------------- Other started -------------------------------
#
# 移除电视盒子专用插件（CR6606路由器不需要）
rm -rf package/luci-app-amlogic

# 1. 添加 多WAN自动登录插件（Zesuy 核心）
git clone https://github.com/Zesuy/luci-app-multi-login.git package/luci-app-multi-login

# 2. 添加 校园网防检测插件（rkp-ipid）
git clone https://github.com/pexcn/openwrt-rkp-ipid.git package/rkp-ipid

# 3. 添加 Argon 主题配置插件
git clone https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config

# 4. 添加 广告屏蔽 AdGuard Home
git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/luci-app-adguardhome

# 更新插件依赖（必须执行）
./scripts/feeds update -a
./scripts/feeds install -a
#
# ------------------------------- Other ends -------------------------------
