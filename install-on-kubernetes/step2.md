App Credentials (appcreds) are JSON files that contain a negociated
x509 certificate used for authentication
as well as more information about the control plane.

> Learn more about [App Credentials](https://docs.aporeto.com/saas/reference/resources/app-cred/).

We need to create an one appcred for
[enforcerd](https://docs.aporeto.com/saas/concepts/#enforcer)
and one for [aporeto-operator](https://docs.aporeto.com/saas/start/enforcer/k8s/).
As we are going to deploy both enforcerd and aporeto-operator in the Kubernetes namespaces `aporeto` and `aporeto-operator`, we must first create these namespaces:

```
kubectl create namespace aporeto
kubectl create namespace aporeto-operator
```{{execute}}

Then create the appcreds for aporeto-operator:

```
apoctl appcred create aporeto-operator \
  --role @auth:role=aporeto-operator \
  --type k8s | kubectl apply -f - -n aporeto-operator
```{{execute}}

This creates the appcred named `aporeto-operator` in the
aporeto-operator namespace with the role `aporeto-operator` and
prints the output as a
[Kubernetes Secret Definition](https://kubernetes.io/docs/concepts/configuration/secret/).
The output is then piped to `kubectl` to apply it in the Kubernetes namespace `aporeto-operator`.

Then create the appcreds for enforcerd:

```
apoctl appcred create enforcerd \
  --role @auth:role=enforcer \
  --type k8s | kubectl apply -f - -n aporeto
```{{execute}}

This does the same for an the appcred named `enforcerd` with the role `enforcer` in the namespace `aporeto`.

You can interact with your appcreds with apoctl. For example:

```
apoctl appcreds list
```{{execute}}
