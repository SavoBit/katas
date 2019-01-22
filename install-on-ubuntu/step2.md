We will now install enforcerd.

First, we need to add add Aporeto GPG key to verify the package signature:

```
curl http://download.aporeto.com/aporeto-packages.gpg | apt-key add -
```{{execute}}

Then we need to add Aporeto Packages Repository to our apt sources:

```
echo "deb https://repo.aporeto.com/ubuntu/16 aporeto main" > /etc/apt/sources.list.d/aporeto.list
```{{execute}}

Then we can install enforcerd:

```
apt update && apt -y install enforcerd
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
