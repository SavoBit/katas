# Install Enforcerd

## Add Aporeto Helm Repository

To add the Aporeto Helm repository run:

```helm repo add aporeto https://helm.aporeto.com/clients```{{execute}}


## Create an app credential for enforcerd

```
apoctl appcred create enforcerd \
  --role @auth:role=enforcer \
  --type k8s | kubectl apply -f -  -n kube-system
```{{execute}}


## Create an app credential for enforcerd

```
apoctl appcred create aporeto-operator \
  --role @auth:role=aporeto-operator \
  --type k8s | kubectl apply -f -  -n kube-system
```{{execute}}
