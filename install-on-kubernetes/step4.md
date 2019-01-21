Now we can install a demo app.

First we deploy the related policies:

```
apoctl api import \
  --namespace $APOCTL_NAMESPACE/default \
  --url https://aporeto-inc.github.io/appblock/3tiers-app/aporeto-import.yaml \
  --set nodePort=32683
```{{execute}}

Then we deploy the demo app:

```
helm install https://aporeto-inc.github.io/appblock/3tiers-app/3tiers-app-1.0.0.tgz
```{{execute}}

You can get the public port of the app ui whith:

```
k get services ui -o json | jq -r .spec.ports[0].nodePort
```{{execute}}

You can then access the UI by clicking on the little `+` button at the top
of the terminal then choose `Select port to view on Host 1` and enter the
port given by the previous command.

You can acess the demo app UI from this url:

https://[[HOST_SUBDOMAIN]]-32683-[[KATACODA_HOST]].environments.katacoda.com/
