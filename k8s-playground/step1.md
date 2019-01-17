# Aporeto Kubernetes Playground

## Setup environment

To configure your namespace, use the command:

```
export APOCTL_ACCOUNT=your-account
export APOCTL_NAMESPACE=/$APOCTL_ACCOUNT
```{{copy}}


## Authenticate

To retrieve a token, run the command:

`eval $(apoctl auth aporeto -e)`{{execute}}
