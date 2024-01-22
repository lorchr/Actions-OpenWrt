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

# Modify default IP
sed -i 's/192.168.1.1/192.168.1.254/g' package/base-files/files/bin/config_generate

# Modify hostname
# sed -i 's/OpenWrt/OpenWrt/g' package/base-files/files/bin/config_generate

# Modify the version number
sed -i "s/OpenWrt /OpenWrt @ Build By Lorchr $(TZ=UTC-8 date "+%Y.%m.%d")/g" package/base-files/files/etc/sysctl.conf

# Modify default theme
# sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Delete default password
# sed -i "/CYXluq4wUazHjmCDBCqXF/d" package/base-files/files/etc/sysctl.conf

# Add kernel build user
[ -z $(grep "CONFIG_KERNEL_BUILD_USER=" .config) ] &&
    echo 'CONFIG_KERNEL_BUILD_USER="Lorchr"' >>.config ||
    sed -i 's@\(CONFIG_KERNEL_BUILD_USER=\).*@\1$"Lorchr"@' .config

# Add kernel build domain
[ -z $(grep "CONFIG_KERNEL_BUILD_DOMAIN=" .config) ] &&
    echo 'CONFIG_KERNEL_BUILD_DOMAIN="github.com"' >>.config ||
    sed -i 's@\(CONFIG_KERNEL_BUILD_DOMAIN=\).*@\1$"github.com"@' .config

# 修改连接数
# sed -i 's/net.netfilter.nf_conntrack_max=.*/net.netfilter.nf_conntrack_max=65535/g' package/kernel/linux/files/sysctl-nf-conntrack.conf
# 修正连接数（by ベ七秒鱼ベ）
sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=65535' package/base-files/files/etc/sysctl.conf

# Add Themes
# git clone https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom package/luci-theme-infinityfreedom
# git clone https://github.com/Leo-Jo-My/luci-theme-opentomcat.git package/luci-theme-opentomcat
# git clone https://github.com/openwrt-develop/luci-theme-atmaterial.git package/luci-theme-atmaterial
git clone https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon

# Add extra Packages
# git clone https://github.com/sirpdboy/luci-app-netdata.git package/luci-app-netdata
git clone https://github.com/vernesong/OpenClash.git --depth=1 package/OpenClash
git clone https://github.com/xiaoxiao29/luci-app-adguardhome.git package/luci-app-adguardhome

# Add CPU Tempreture Display
# sed -i 's|pcdata(boardinfo.system or "?")|luci.sys.exec("uname -m") or "?"|g' feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm
# sed -i 's/or "1"%>/or "1"%> ( <%=luci.sys.exec("expr `cat \/sys\/class\/thermal\/thermal_zone0\/temp` \/ 1000") or "?"%> \&#8451; ) /g' feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm

# Modify NTP Server
sed -i "s/0.openwrt.pool.ntp.org/ntp.aliyun.com/g" package/base-files/files/bin/config_generate
sed -i "s/1.openwrt.pool.ntp.org/cn.ntp.org.cn/g" package/base-files/files/bin/config_generate
sed -i "s/2.openwrt.pool.ntp.org/cn.pool.ntp.org/g" package/base-files/files/bin/config_generate
