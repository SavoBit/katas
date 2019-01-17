We need to create some app credentials for
enforcerd and aporeto-operator.

For aporeto-operator:

```
apoctl appcred create aporeto-operator \
  --role @auth:role=aporeto-operator \
  --type k8s | kubectl apply -f - -n kube-system
```{{execute}}

For enforcerd:

```
apoctl appcred create enforcerd \
  --role @auth:role=enforcer \
  --type k8s | kubectl apply -f - -n kube-system
```{{execute}}
