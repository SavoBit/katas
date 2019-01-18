#!/bin/bash

# DO NOT EDIT OUTSIDE OD /common folder

APORETO_RELEASE="3.5.0-r5"

# start k8s
launch.sh &

# get apoctl
curl "https://download.aporeto.com/releases/release-$DEFAULT_RELEASE/apoctl/linux/apoctl" -o /usr/local/bin/apoctl
chmod +x /usr/local/bin/apoctl

echo "$APORETO_RELEASE" > /etc/APORETO_RELEASE
