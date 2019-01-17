#!/bin/bash

APOCTL_VERSION=1.235.2

# start k8s
launch.sh &

# get apoctl
curl "https://download.aporeto.com/files/apoctl/linux/apoctl-v$APOCTL_VERSION" -o /usr/local/bin/apoctl
chmod +x /usr/local/bin/apoctl

# init helm

helm init

mkdir -p ~/.helm/repository/local/
gunzip /tmp/helm-repo.zip
mv repo/* ~/.helm/repository/local/

pkill helm && helm serve &
