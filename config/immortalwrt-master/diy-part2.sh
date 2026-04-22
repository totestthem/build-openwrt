#!/bin/bash

# 设置默认主题为 Argon
# sed -i 's/CONFIG_DEFAULT_THEME.*/CONFIG_DEFAULT_THEME="argon"/' .config

# 关闭自带主题
# sed -i 's/CONFIG_PACKAGE_luci-theme-bootstrap=y/CONFIG_PACKAGE_luci-theme-bootstrap=n/' .config

# 网络高性能优化
echo "net.netfilter.nf_conntrack_max=65535" >> package/base-files/files/etc/sysctl.conf
echo "net.ipv4.tcp_syncookies=1" >> package/base-files/files/etc/sysctl.conf
echo "net.ipv4.tcp_tw_reuse=1" >> package/base-files/files/etc/sysctl.conf
echo "net.ipv4.tcp_window_scaling=1" >> package/base-files/files/etc/sysctl.conf
echo "net.core.default_qdisc=fq" >> package/base-files/files/etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> package/base-files/files/etc/sysctl.conf

#添加多wan自动登录
#echo "CONFIG_PACKAGE_luci-app-multi-login=y" >> .config
#echo "CONFIG_PACKAGE_luci-app-openclash=y" >> .config
#echo "CONFIG_PACKAGE_ua3f=y" >> .config


#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# 1. 替换为清华大学 ImmortalWrt 软件源
sed -i 's,downloads.immortalwrt.org,mirrors.tuna.tsinghua.edu.cn/immortalwrt,g' package/base-files/files/etc/opkg/distfeeds.conf
sed -i 's,downloads.immortalwrt.org,mirrors.tuna.tsinghua.edu.cn/immortalwrt,g' package/system/opkg/files/customfeeds.conf

# 2. 可选：修改默认管理IP（如果需要）
# sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

# 3. 可选：修改默认主机名
# sed -i 's/ImmortalWrt/CR6606/g' package/base-files/files/bin/config_generate

# 4. 可选：修改默认密码（这里是password，建议自行修改）
# sed -i 's/root:::0:99999:7:::/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0:0:99999:7:::/g' package/base-files/files/etc/shadow
#echo "CONFIG_PACKAGE_rkp-ipid=y" >> .config

#echo "CONFIG_PACKAGE_luci-app-turboacc=y" >> .config
