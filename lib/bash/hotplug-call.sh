#!/bin/sh
# Copyright (C) 2006-2016 OpenWrt.org

export HOTPLUG_TYPE="$1"

. /lib/functions.sh

PATH="/usr/sbin:/usr/bin:/sbin:/bin"
LOGNAME=root
USER=root
export PATH LOGNAME USER
export DEVICENAME="${DEVPATH##*/}"

if [ \! -z "$1" -a -d /etc/hotplug.d/$1 ]; then
        for script in $(ls /etc/hotplug.d/$1/* 2>&-); do (
                [ -f $script ] && . $script
        ); done
fi
