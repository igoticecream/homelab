#!/usr/bin/env bash

set -e

echo "Uninstalling tun.service"

systemctl stop tun.service
systemctl disable tun.service

rm /etc/systemd/system/tun.service

echo "Done"
