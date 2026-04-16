#!/bin/bash

# 修改默认IP（可选，保持 192.168.1.1 即可）
sed -i 's/192.168.1.1/192.168.1.1/g' package/base-files/files/bin/config_generate

# 版本号里显示编译时间
sed -i "s/OpenWrt /OpenWrt Build $(TZ=UTC-8 date +%Y.%m.%d) /g" package/lean/default-settings/files/zzz-default-settings

# 添加 多WAN自动登录插件（Zesuy 核心）
git clone https://github.com/Zesuy/luci-app-multi-login package/luci-app-multi-login

# 添加 校园网防检测（rkp-ipid）
git clone https://github.com/pexcn/openwrt-rkp-ipid package/rkp-ipid

# 添加 闭源WiFi驱动（CR6606 信号增强）
git clone https://github.com/openwrt/mt76.git package/mt76

# 添加 主题 Argon 配置
git clone https://github.com/jerrykuku/luci-app-argon-config package/luci-app-argon-config

# 添加 AdGuard Home
git clone https://github.com/rufengsuixing/luci-app-adguardhome package/luci-app-adguardhome

# 添加 SmartDNS + DoH
git clone https://github.com/pymumu/smartdns.git package/smartdns
git clone https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns

# 添加 常用工具
git clone https://github.com/tty228/luci-app-wrtbwmon package/luci-app-wrtbwmon

# 更新 feeds 并安装所有插件（必须）
./scripts/feeds update -a
./scripts/feeds install -a

# 权限设置
chmod -R 755 package/luci-app-multi-login
chmod -R 755 package/rkp-ipid
