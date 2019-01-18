#!/bin/bash

# DO NOT EDIT OUTSIDE OD /common folder

# Set the aporeto release here.
# that's all.
DEFAULT_RELEASE="3.5.0-r5"

marked_release=$(cat /etc/APORETO_RELEASE)
APORETO_RELEASE=${marked_release:-$DEFAULT_RELEASE}

# start k8s
launch.sh &

# get apoctl
curl "https://download.aporeto.com/releases/release-$APORETO_RELEASE/apoctl/linux/apoctl" -o /usr/local/bin/apoctl
chmod +x /usr/local/bin/apoctl

echo "${APORETO_RELEASE:-$RELEASE}" > /etc/APORETO_RELEASE
