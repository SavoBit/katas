We need to create an app credentials for
enforcerd and aporeto-operator.

Let's create an appcred for aporeto-operator:

```
apoctl appcred create aporeto-operator \
  --role @auth:role=aporeto-operator \
  --type k8s | kubectl apply -f -  -n kube-system
```{{execute}}

Then let's create an appcred for enforcerd:

```
apoctl appcred create enforcerd \
  --role @auth:role=enforcer \
  --type k8s | kubectl apply -f -  -n kube-system
```{{execute}}


# Protect the Kubernetes cluster
