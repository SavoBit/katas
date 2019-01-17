Finally we deploy the charts using helm.

* aporeto-operator will install a daemon and some crds
* enforcerd will be deployed as a daemonset

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
