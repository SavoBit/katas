#!/bin/bash

echo "> Downloading enforcerd"
curl -sSL "https://download.aporeto.com/releases/$APORETO_RELEASE/enforcerd/linux/enforcerd" -o /usr/local/bin/enforcerd
chmod +x /usr/local/bin/enforcerd

docker pull "aporeto/enforcerd:$(cat /etc/APORETO_RELEASE)"
