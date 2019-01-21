#!/bin/bash

echo "> Downloading enforcerd"

curl http://download.aporeto.com/aporeto-packages.gpg | apt-key add -
echo "deb https://repo.aporeto.com/deb/apt aporeto main" | sudo tee /etc/apt/sources.list.d/aporeto.list
apt update

apt install enforcerd

cat << EOF > /etc/enforcerd.conf
# this notation is deprecateds
ENFORCERD_SQUALL_NAMESPACE=$APOCTL_NAMESPACE
ENFORCERD_NAMESPACE=$APOCTL_NAMESPACE
EOF

mkdir -p /var/lib/aporeto
apoctl appcred create enforcerd \
  --role @auth:role=enforcer \
  > /var/lib/aporeto/default.creds
