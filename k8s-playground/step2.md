# Install Enforcerd

## Add Aporeto Helm Repository

To add the Aporeto Helm repository run:

```helm repo add aporeto https://helm.aporeto.com```{{execute}}


## Create an app credential

```
apoctl appcred create enforcerd \
  --role @auth:role=enforcer \
  --type k8s | kubectl apply -f -n kube-system
```{{execute}}
