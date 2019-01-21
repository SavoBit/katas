#!/bin/bash

echo "> Downloading enforcerd"

curl http://download.aporeto.com/aporeto-packages.gpg | apt-key add -
echo "deb https://repo.aporeto.com/deb/apt aporeto main" | sudo tee /etc/apt/sources.list.d/aporeto.list
apt update

cat << EOF > /etc/enforcerd.conf
ENFORCERD_API=$APOCTL_API
ENFORCERD_SQUALL_NAMESPACE=$APOCTL_NAMESPACE
EOF
