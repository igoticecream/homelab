#!/usr/bin/env bash

set -e

if ( !(lsmod | grep -q "^tun\s") ); then
    insmod /lib/modules/tun.ko
fi
