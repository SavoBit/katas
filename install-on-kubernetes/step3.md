Finally we deploy the charts using helm.

* aporeto-operator installs a deployment and crds
* enforcerd installs as a daemonset

Deploy aporeto-operator:

```
helm install \
    --name aporeto-operator \
    --namespace kube-system \
    aporeto/aporeto-operator
```{{execute}}


Deploy enforcerd:

```
helm install \
    --name enforcerd \
    --namespace kube-system \
    aporeto/enforcerd
```{{execute}}

To verify the status of the protection workload:

```
kubectl get pods -l type=aporeto -n kube-system
```{{execute}}
