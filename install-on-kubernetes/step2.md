App Credentials (appcreds) are JSON files that contain a negociated
x509 certificate used for authentication
as well as more information about the control plane.

> Learn more about [App Credentials](https://junon.console.aporeto.com/docs/main/references/appcredentials/).

We need to create an one appcred for
[enforcerd](https://junon.console.aporeto.com/docs/main/concepts/enforcerd-and-processing-units/)
and one for [aporeto-operator](https://junon.console.aporeto.com/docs/main/installation/install-on-kubernetes/).
As we are going to deploy both enforcerd and aporeto-operator in a Kubernetes namespace `aporeto`, we must first create this namespace:

```
kubectl create namespace aporeto
```{{execute}}

Then create the appcreds for aporeto-operator:

```
apoctl appcred create aporeto-operator \
  --role @auth:role=aporeto-operator \
  --type k8s | kubectl apply -f - -n aporeto
```{{execute}}

This creates the appcred named `aporeto-operator` in the
current apoctl namespace with the role `aporeto-operator` and
prints the output as a
[Kubernetes Secret Definition](https://kubernetes.io/docs/concepts/configuration/secret/).
The output is then piped to `kubectl` to apply it in the Kubernetes namespace `aporeto`.

Then create the appcreds for enforcerd:

```
apoctl appcred create enforcerd \
  --role @auth:role=enforcer \
  --type k8s | kubectl apply -f - -n aporeto
```{{execute}}

This does the same for an the appcred named `enforcerd` with the role `enforcer`.

You can interact with your appcreds with apoctl. For example:

```
apoctl appcreds list
```{{execute}}
