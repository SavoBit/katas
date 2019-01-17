#!/bin/bash

echo "toto" > /opt/hello
launch.sh &
pid="$!"

curl https://download.aporeto.com/files/apoctl/linux/apoctl-v1.235.2 -o /usr/local/bin/apoctl
chmod +x /usr/local/bin/apoctl

wait "$pid"
