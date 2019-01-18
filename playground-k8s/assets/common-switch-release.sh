#!/bin/bash

APORETO_RELEASE_CURRENT="$(cat /etc/APORETO_RELEASE)"

if [[ "$1" == "" ]]; then
    echo -n "Release version? (current: $APORETO_RELEASE_CURRENT): "
    read -r APORETO_RELEASE
fi

echo "Switching from $APORETO_RELEASE_CURRENT to $APORETO_RELEASE"

echo "$APORETO_RELEASE" > /etc/APORETO_RELEASE
/opt/common-setup-aporeto.sh
