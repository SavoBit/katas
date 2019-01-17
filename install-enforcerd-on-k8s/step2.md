# Create an app credential for enforcerd

```
apoctl appcred create enforcerd \
  --role @auth:role=enforcer \
  --type k8s | kubectl apply -f -  -n kube-system
```{{execute}}

To verify :

```
kubectl get secret enforcerd -n kube-system
```{{execute}}

# Create an app credential for aporeto operator

```
apoctl appcred create aporeto-operator \
  --role @auth:role=aporeto-operator \
  --type k8s | kubectl apply -f -  -n kube-system
```{{execute}}

To verify :

```
kubectl get secret aporeto-operator -n kube-system
```{{execute}}


# Deploy Aporeto Operator

```
helm install aporeto/aporeto-operator
```{{execute}}

# Deploy Aporeto Enforcerd

```
helm install aporeto/enforcerd
```{{execute}}
