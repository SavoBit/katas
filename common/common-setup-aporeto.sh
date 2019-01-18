#!/bin/bash

# DO NOT EDIT OUTSIDE OD /common folder

# Set the aporeto release here. That's all.
DEFAULT_RELEASE="3.5.0-r5"

marked_release=$(cat /etc/APORETO_RELEASE)
APORETO_RELEASE=${marked_release:-$DEFAULT_RELEASE}
echo "$APORETO_RELEASE" > /etc/APORETO_RELEASE

# get apoctl
curl -sSL "https://download.aporeto.com/releases/release-$APORETO_RELEASE/apoctl/linux/apoctl" -o /usr/local/bin/apoctl
chmod +x /usr/local/bin/apoctl

# start k8s
launch.sh &
