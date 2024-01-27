#!/usr/bin/env bash

set -e

echo "Installing tun.service"

if curl -sL https://raw.githubusercontent.com/igoticecream/homelab/main/scripts/systemd/tun/tun.service -o "/etc/systemd/system/tun.service"; then
    echo "Service file to start Tun downloaded."
fi

chmod 644 /etc/systemd/system/tun.service

systemctl enable /etc/systemd/system/tun.service
systemctl start tun.service

echo "Done"
