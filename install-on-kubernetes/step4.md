Now we can install a demo app.

First we deploy the related policies:

```
apoctl api import \
  --namespace $APOCTL_NAMESPACE/default \
  --url https://aporeto-inc.github.io/appblock/3tiers-app/aporeto-import.yaml
```{{execute}}

Then we deploy the demo app:

```
helm install https://aporeto-inc.github.io/appblock/3tiers-app/3tiers-app-1.0.0.tgz
```{{execute}}
