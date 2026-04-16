#!/bin/bash
# 定制版本信息
sed -i "s/OpenWrt /CR6606-Lean-$(TZ=UTC-8 date +%Y.%m.%d) /g" package/lean/default-settings/files/zzz-default-settings

# 1.多WAN自动登录 Zesuy 官方
git clone https://github.com/Zesuy/luci-app-multi-login.git package/luci-app-multi-login

# 2.校园网防检测 rkp-ipid
git clone https://github.com/pexcn/openwrt-rkp-ipid.git package/rkp-ipid

# 3.主题 & 增强插件
git clone https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config
git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/luci-app-adguardhome

# 更新依赖
./scripts/feeds update -a
./scripts/feeds install -a
