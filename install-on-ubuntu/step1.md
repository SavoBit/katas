For enforcerd to work optimaly, we must disable Docker's userland proxy:

```
jq '. + {"userland-proxy": false}' /etc/docker/daemon.json > /etc/docker/daemon.json.new
mv /etc/docker/daemon.json.new /etc/docker/daemon.json
```{{execute}}

Then we must restart Docker:

```
systemctl restart docker
```{{execute}}
