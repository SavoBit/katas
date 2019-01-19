Here are some useful commands:

Check workloads status:

```kubectl -n kube-system get pods```{{execute}}

Check enforcerd logs:

```kubectl logs -n kube-system -l app=enforcerd```{{execute}}

Check aporeto-operator logs:

```kubectl logs -n kube-system -l app=aporeto-operator```{{execute}}
