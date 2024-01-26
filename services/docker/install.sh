#!/usr/bin/env bash

set -e

if curl -sL https://raw.githubusercontent.com/igoticecream/homelab/main/services/docker/docker.service -o "/etc/systemd/system/docker.service"; then
    echo "Service file to start Docker downloaded."
fi

if curl -sL https://raw.githubusercontent.com/igoticecream/homelab/main/services/docker/docker.sh -o "/volume1/scripts/docker.sh"; then
    echo "Shell script file to start Docker downloaded."
fi

echo "Installing docker.service"

chmod 774 /volume1/scripts/docker.sh
chmod 644 /etc/systemd/system/docker.service

systemctl enable /etc/systemd/system/docker.service
systemctl start docker.service

echo "Done"
