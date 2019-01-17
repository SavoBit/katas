
Before you start make sure you have an account on
https://console.aporeto.com.
If not, create a one.

> You must be familiar with the basic concepts
> of aporeto to understand what you'll be doing.

First and foremost, copy the snippet below and paste
it in the terminal to set your account:

```eval %(echo export APOCTL_ACCOUNT=?)```{{execute}}




# Configure your account

We will need an api token to issue commands.

To configure your namespace, first copy and paste
the following command, and set your account name.



Then authenticate:

```
export APOCTL_NAMESPACE=/$APOCTL_ACCOUNT
eval $(apoctl auth aporeto --account $APOCTL_ACCOUNT -e)
```{{execute}}
