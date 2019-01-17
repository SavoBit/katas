#!/bin/bash

launch.sh &
pid="$!"

curl https://download.aporeto.com/files/apoctl/linux/apoctl-v1.235.2 -o /tmp/apoctl
chmod +x /tmp/apoctl


wait "$pid"
