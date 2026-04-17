#!/bin/bash

# 设置默认主题为 Argon
sed -i 's/CONFIG_DEFAULT_THEME.*/CONFIG_DEFAULT_THEME="argon"/' .config

# 关闭自带主题
sed -i 's/CONFIG_PACKAGE_luci-theme-bootstrap=y/CONFIG_PACKAGE_luci-theme-bootstrap=n/' .config

# 网络高性能优化
echo "net.netfilter.nf_conntrack_max=65535" >> package/base-files/files/etc/sysctl.conf
echo "net.ipv4.tcp_syncookies=1" >> package/base-files/files/etc/sysctl.conf
echo "net.ipv4.tcp_tw_reuse=1" >> package/base-files/files/etc/sysctl.conf
echo "net.ipv4.tcp_window_scaling=1" >> package/base-files/files/etc/sysctl.conf
echo "net.core.default_qdisc=fq" >> package/base-files/files/etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> package/base-files/files/etc/sysctl.conf
