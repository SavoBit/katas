
Before you start make sure you have an Aporeto account.
If you don't, you can create a free account at
<https://console.aporeto.com/register>.

> You must be familiar with the basic concepts
> of Aporeto to understand what you'll be doing.

First and foremost, please configure your account
name for this training session by clicking on:

`/opt/common-setup-account.sh && source ~/.aporeto`{{execute}}

To check workloads status:

```kubectl -n kube-system get pods```{{execute}}

To check enforcerd logs:

```kubectl logs -n kube-system -l app=enforcerd```{{execute}}

To check aporeto-operator logs:

```kubectl logs -n kube-system -l app=aporeto-operator```{{execute}}
