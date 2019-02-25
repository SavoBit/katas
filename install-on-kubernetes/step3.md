Finally we deploy the charts using helm.

* aporeto-operator installs a deployment and crds
* enforcerd installs as a daemonset

Deploy aporeto-operator, first deploy the Aporeto CRDs:

```
helm install \
  --name aporeto-crds \
   aporeto/aporeto-crds
```{{execute}}

Then install aporeto-operator:

```
helm install \
    --name aporeto-operator \
    --namespace aporeto \
    aporeto/aporeto-operator
```{{execute}}

Finally, deploy enforcerd:

```
helm install \
    --name enforcerd \
    --namespace aporeto \
    aporeto/enforcerd
```{{execute}}

To verify the status of the protection workload:

```
kubectl get pods -l type=aporeto -n aporeto
```{{execute}}
