#!/usr/bin/env bash

set -e

echo "Installing docker.service"

if curl -sL https://raw.githubusercontent.com/igoticecream/homelab/main/scripts/systemd/docker/docker.service -o "/etc/systemd/system/docker.service"; then
    echo "Service file to start Docker downloaded."
fi

chmod 644 /etc/systemd/system/docker.service

systemctl enable /etc/systemd/system/docker.service
systemctl start docker.service

echo "Done"
