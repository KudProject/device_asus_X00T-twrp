#!/system/bin/sh
# Copyright (C) 2019-2021 KudProject Development
#
# SPDX-License-Identifier: GPL-3.0-or-later OR Apache-2.0

asus_sku=WW
asus_version=16.2017.2009.087

recLog() { echo "[kp] $1" >>/tmp/recovery.log; }

mkdir /s && mount -t ext4 /dev/block/bootdevice/by-name/system /s

[ -f "/s/system/build.prop" ] && system_root=/system
asus_prop=$(grep -E 'asus.sku|asus.version' /s$system_root/build.prop 2>/dev/null)
if [ -n "$asus_prop" ]; then
    echo "$asus_prop" | sed -e 's/ /\n/' > /tmp/asus.prop
    asus_sku=$(grep sku /tmp/asus.prop | cut -d'=' -f2)
    asus_version=$(grep version /tmp/asus.prop | cut -d'=' -f2)
    rm /tmp/asus.prop
else
    recLog "custom firmware detected or no ASUS version found; setting default values"
fi

setprop ro.build.asus.sku "$asus_sku"
setprop ro.build.asus.version "$asus_version"

umount /s && rm -r /s

recLog "setting ASUS version done"
