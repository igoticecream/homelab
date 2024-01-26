#!/usr/bin/env bash

set -e

container_stopped=$(docker ps -aq | xargs docker inspect | jq '.[] | select((.HostConfig.NetworkMode | startswith("container:")) and select(.State.Running == false))' | jq '{Id, Name, NetworkMode: .HostConfig.NetworkMode}')

for i in "${container_stopped[@]}"
do
    if [[ -z "$i" ]]; then
        continue
    fi

    container_name=$(echo "$i" | jq -r '.Name')
    container_id=$(echo "$i" | jq -r '.Id')
    parent_id=$(echo "$i" | jq -r '.NetworkMode' | sed 's/^container://')

    echo "[$container_name] Container is stopped, checking its parent container"

    if docker inspect --format="{{.State.Running}}" "$parent_id" 2>/dev/null | grep -q "true"; then
        echo "[$container_name] Parent container is running"
        echo "[$container_name] Starting container"
        docker start $container_id > /dev/null
    else
        echo "[$container_name] Parent container is not running"
        echo "[$container_name] Skipping"
    fi
done
