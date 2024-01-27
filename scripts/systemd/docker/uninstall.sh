#!/usr/bin/env bash

set -e

echo "Uninstalling docker.service"

systemctl stop docker.service
systemctl disable docker.service

rm /etc/systemd/system/docker.service

echo "Done"
