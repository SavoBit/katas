
Before you start make sure you have an Aporeto account.
If you don't you can create a free account at
<https://console.aporeto.com/register>.

> You must be familiar with the basic concepts
> of Aporeto to understand what you'll be doing.

First and foremost, please configure your account
name for this training session by clicking on:

`setup-account.sh && source ~/.aporeto`{{execute}}

Then retrieve a token:

```
eval $(apoctl auth aporeto --account $APOCTL_ACCOUNT -e)
apoctl api info
```{{execute}}



# Configure your account

We will need an api token to issue commands.

To configure your namespace, first copy and paste
the following command, and set your account name.



Then authenticate:

```
export APOCTL_NAMESPACE=/$APOCTL_ACCOUNT
eval $(apoctl auth aporeto --account $APOCTL_ACCOUNT -e)
```{{execute}}
