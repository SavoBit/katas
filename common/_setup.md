<!-- do not edit outside of /common-->

**Important: You must setup the environment before continuing.**

Please click on the following command then **wait** for it to complete.

`/opt/common-setup.sh && source ~/.aporeto`{{execute}}

> You should be familiar with the
> [Basic Concepts of Aporeto](https://junon.console.aporeto.com).
>
> You must have an Aporeto account.
> If you don't have one, visit <https://console.aporeto.com/register>.
>
> This training session will create the namespace `/{account}/_training/{id}`.
> You can delete the namespace manually by running:
>
> `apoctl delete ns -n $APOCTL_NAMESPACE`{{copy}}
>
> Or delete the namespace `/{account}/_training` at any time.
>
> You have the following tools:
>
> * `apoctl`: aporeto control plane cli
> * `tg`: certificate generation tool
