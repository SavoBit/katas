App Credentials (appcreds) are JSON files that contain a negociated
x509 certificate used for authentication
as well as more information about the control plane.

> Learn more about [App Credentials](https://junon.console.aporeto.com/docs/main/references/appcredentials/).

We need to create an one appcred for
[enforcerd](https://junon.console.aporeto.com/docs/main/concepts/enforcerd-and-processing-units/)

```
mkdir -p /var/lib/aporeto
apoctl appcred create enforcerd \
    --role @auth:role=enforcer \
    > /var/lib/aporeto/default.creds
```{{execute}}

This creates an appcred and places it in `/var/lib/aporeto/default.creds`, which
is the default place enforcerd will look at.
