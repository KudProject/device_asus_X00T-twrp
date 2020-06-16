#!/sbin/sh
# Copyright (C) 2019-2020 KudProject Development
# SPDX-License-Identifier: GPL-3.0-or-later OR Apache-2.0

set -e

asus_sku=WW
asus_version=16.2017.2005.082

mount -t ext4 /dev/block/bootdevice/by-name/system /system

asus_prop=$(grep -E 'asus.sku|asus.version' /system/build.prop)
if [ -n "$asus_prop" ]; then
    echo "$asus_prop" | sed -e 's/ /\n/' > /tmp/asus.prop
    asus_sku=$(grep sku /tmp/asus.prop | cut -d'=' -f2)
    asus_version=$(grep version /tmp/asus.prop | cut -d'=' -f2)
    rm /tmp/asus.prop
else
    echo "[kp] custom firmware detected or no ASUS version found; setting default values" >> /tmp/recovery.log
fi

setprop ro.build.asus.sku "$asus_sku"
setprop ro.build.asus.version "$asus_version"

umount /system

echo "[kp] setting ASUS version done." >> /tmp/recovery.log
