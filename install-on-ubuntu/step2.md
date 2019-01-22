We will now install enforcerd.


First, we need to add the Aporeto Package repository:

```
curl http://download.aporeto.com/aporeto-packages.gpg | apt-key add -
echo "deb https://repo.aporeto.com/deb/apt aporeto main" | sudo tee /etc/apt/sources.list.d/aporeto.list
```{{execute}}

Then we can install enforcerd:

```
apt update
apt -y install enforcerd
```{{execute}}

We can now create an appcred for our enforcerd:

```
mkdir -p /var/lib/aporeto
apoctl appcred create enforcerd \
    --role @auth:role=enforcer \
    > /var/lib/aporeto/default.creds
```{{execute}}

And finally restart enforcerd:

```
systemctl restart enforcerd
```{{execute}}
