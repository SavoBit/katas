#!/bin/bash

# DO NOT EDIT OUTSIDE OD /common folder

# Set the aporeto release here. That's all.
DEFAULT_RELEASE="release-3.9.1"

marked_release=$(cat /etc/APORETO_RELEASE)
APORETO_RELEASE=${marked_release:-$DEFAULT_RELEASE}
echo "$APORETO_RELEASE" > /etc/APORETO_RELEASE
echo "Switching to $APORETO_RELEASE"

# get apoctl
echo "> Downloading apoctl"
curl -sSL "https://download.aporeto.com/releases/$APORETO_RELEASE/apoctl/linux/apoctl" -o /usr/local/bin/apoctl
chmod +x /usr/local/bin/apoctl

echo "> Downloading tg"
curl -sSL "https://download.aporeto.com/releases/$APORETO_RELEASE/tg/linux/tg" -o /usr/local/bin/tg
chmod +x /usr/local/bin/tg

cat << EOF > ~/.profile
alias nslink="echo \$DEFAULT_CLAD_URL/?namespace=$APOCTL_NAMESPACE"
EOF

# start k8s
echo "> Starting Kubernetes"
launch.sh &

echo
echo "Now, to update the Katacoda environment, please type:"
echo
echo "  /opt/common-setup.sh && source ~/.aporeto"
echo
