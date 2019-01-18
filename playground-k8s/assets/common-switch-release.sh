#!/bin/bash

if [[ "$1" == "" ]]; then
    echo -n "Release version? (current: $APORETO_RELEASE): "
    read -r APORETO_RELEASE
fi

echo "Switching to $APORETO_RELEASE"

echo "$APORETO_RELEASE" /etc/APORETO_RELEASE && /opt/common-setup-aporeto.sh

echo
echo "Switched to $APORETO_RELEASE."
echo "type '/opt/common-setup.sh' to update the katacoda environment."
