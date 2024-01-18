#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
# sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
sed -i '$a src-git opp https://github.com/kenzok8/openwrt-packages.git' feeds.conf.default
sed -i '$a src-git sml https://github.com/kenzok8/small.git' feeds.conf.default
# sed -i '$a src-git pkgs https://github.com/ysx88/openwrt-packages' feeds.conf.default
# sed -i '$a src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main' >> feeds.conf.default
# sed -i '$a src-git haiibo https://github.com/haiibo/openwrt-packages' feeds.conf.default

echo 'src-git helloworld https://github.com/fw876/helloworld' >> feeds.conf.default
echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >> feeds.conf.default
echo 'src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2.git;main' >> feeds.conf.default
echo 'src-git openclash https://github.com/vernesong/OpenClash' >> feeds.conf.default
echo 'src-git ssrplus https://github.com/maxlicheng/luci-app-ssr-plus' >> feeds.conf.default

# Themes
# git clone --depth=1 https://github.com/derisamedia/luci-theme-alpha package/luci-theme-alpha
# git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon
# git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config package/luci-app-argon-config
# git clone --depth=1 https://github.com/Mrbai98/luci-theme-atmaterial package/luci-theme-atmaterial
# git clone --depth=1 -b 18.06 https://github.com/kiddin9/luci-theme-edge package/luci-theme-edge
# git clone --depth=1 https://github.com/gngpp/luci-theme-design package/luci-theme-design
# git clone --depth=1 https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom package/luci-theme-infinityfreedom
# git clone --depth=1 https://github.com/LuttyYang/luci-theme-material package/luci-theme-material
# git clone --depth=1 https://github.com/ysoyipek/luci-theme-netgear package/luci-theme-netgear
# git clone --depth=1 https://github.com/thinktip/luci-theme-neobird package/luci-theme-neobird
# git clone --depth=1 https://github.com/Leo-Jo-My/luci-theme-opentomcat package/luci-theme-opentomcat
# git clone --depth=1 https://github.com/sirpdboy/luci-theme-opentopd package/luci-theme-opentopd
# git clone --depth=1 -b openwrt-18.06 https://github.com/rosywrt/luci-theme-rosy package/luci-theme-rosy

# 更改 Argon 主题背景
# cp -f $GITHUB_WORKSPACE/images/bg1.jpg package/luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg
