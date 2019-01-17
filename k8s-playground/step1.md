# Authentication

## Authenticate

To configure your namespace, first copy and paste
the following command, and set your account name.

```export APOCTL_ACCOUNT=your-account```{{copy}}

Then authenticate:

```
eval $(apoctl auth aporeto --account $APOCTL_ACCOUNT -e)
export APOCTL_NAMESPACE=$APOCTL_ACCOUNT
```{{execute}}
