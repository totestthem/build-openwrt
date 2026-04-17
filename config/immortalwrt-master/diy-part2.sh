#!/bin/bash
cd openwrt

# 启用无线驱动
sed -i 's/# CONFIG_PACKAGE_kmod-mt7915e is not set/CONFIG_PACKAGE_kmod-mt7915e=y/' .config
sed -i 's/# CONFIG_PACKAGE_kmod-mt7621 is not set/CONFIG_PACKAGE_kmod-mt7621=y/' .config

# 启用 Argon 主题
sed -i 's/CONFIG_DEFAULT_THEME.*/CONFIG_DEFAULT_THEME="argon"/' .config

# 关闭默认主题
sed -i 's/CONFIG_PACKAGE_luci-theme-bootstrap=y/CONFIG_PACKAGE_luci-theme-bootstrap=n/' .config

# 网络优化
echo "net.netfilter.nf_conntrack_max=65535" >> package/base-files/files/etc/sysctl.conf
echo "net.ipv4.tcp_syncookies=1" >> package/base-files/files/etc/sysctl.conf
echo "net.ipv4.tcp_tw_reuse=1" >> package/base-files/files/etc/sysctl.conf
echo "net.ipv4.tcp_window_scaling=1" >> package/base-files/files/etc/sysctl.conf
