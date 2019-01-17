
> You must have an Aporeto account.
> If you don't have one, visit <https://console.aporeto.com/register>.
>
> You should be familiar with the [basic concepts](https://docs.console.aporeto.com)
> of Aporeto to understand what you'll be doing.

# Setup playground

First and foremost, please configure your account
name for this training session by clicking on:

`/opt/common-account.sh && source ~/.aporeto`{{execute}}

# Useful commands

To check workloads status:

```kubectl -n kube-system get pods```{{execute}}

To check enforcerd logs:

```kubectl logs -n kube-system -l app=enforcerd```{{execute}}

To check aporeto-operator logs:

```kubectl logs -n kube-system -l app=aporeto-operator```{{execute}}
