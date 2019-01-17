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

Finally we deploy the charts using helm.


First we deploy aporeto-operator:

```
helm install \
    --name aporeto-operator \
    --namespace kube-system \
    aporeto/aporeto-operator
```{{execute}}


Then we deploy enforcerd:

```
helm install \
    --name enforcerd \
    --namespace kube-system \
    aporeto/enforcerd
```{{execute}}

To verify the status of the protection workload:

```
kubectl get pods -l type=aporeto
```execute
