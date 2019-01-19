Here are some useful commands:

Create an appcred:

```
mkdir -p /var/lib/aporeto
apoctl appcred create enforcerd \
  --role @auth:role=enforcer \
  > /var/lib/aporeto/default.creds
```{{execute}}

Start enforcerd in your namespace

```
enforcerd --squall-namespace $APORETO_NAMESPACE
```{{execute}}
