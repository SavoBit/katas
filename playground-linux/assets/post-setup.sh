#!/bin/bash

echo "Installing enforcerd..."

(
    curl http://download.aporeto.com/aporeto-packages.gpg | apt-key add -
    echo "deb https://repo.aporeto.com/ubuntu/$(lsb_release -cs) aporeto main" | sudo tee /etc/apt/sources.list.d/aporeto.list

    jq '. + {"userland-proxy": false}' /etc/docker/daemon.json > /etc/docker/daemon.json.new
    mv /etc/docker/daemon.json.new /etc/docker/daemon.json
    systemctl restart docker


    mkdir -p /var/lib/aporeto
    apoctl appcred create enforcerd \
    --role @auth:role=enforcer \
    > /var/lib/aporeto/default.creds

    apt update && apt -y install enforcerd
    systemctl start enforcerd

) > /opt/aporeto-init.log 2>&1

echo "* enforcerd: OK"
