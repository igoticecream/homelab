#!/usr/bin/env bash

set -e

if curl -sL https://raw.githubusercontent.com/igoticecream/homelab/main/services/tun/tun.service -o "/etc/systemd/system/tun.service"; then
    echo "Service file to start Tun downloaded."
fi

if curl -sL https://raw.githubusercontent.com/igoticecream/homelab/main/services/tun/tun.sh -o "/volume1/scripts/tun.sh"; then
    echo "Shell script file to start Tun downloaded."
fi

echo "Installing tun.service"

chmod 774 /volume1/scripts/tun.sh
chmod 644 /etc/systemd/system/tun.service

systemctl enable /etc/systemd/system/tun.service
systemctl start tun.service

echo "Done"
