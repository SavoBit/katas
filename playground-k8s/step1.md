Here are some useful commands:

Check workloads status:

```kubectl -n aporeto get pods```{{execute}}

Check enforcerd logs:

```kubectl logs -n aporeto -l app=enforcerd```{{execute}}

Check aporeto-operator logs:

```kubectl logs -n aporeto -l app=aporeto-operator```{{execute}}
