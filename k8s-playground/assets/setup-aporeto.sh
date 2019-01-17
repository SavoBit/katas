#!/bin/bash

APOCTL_VERSION=1.235.2

launch.sh &
pid="$!"

curl "https://download.aporeto.com/files/apoctl/linux/apoctl-v$APOCTL_VERSION" -o /usr/local/bin/apoctl
chmod +x /usr/local/bin/apoctl

wait "$pid"

helm init
helm repo add aporeto https://charts.aporeto.com/_unstable/clients
