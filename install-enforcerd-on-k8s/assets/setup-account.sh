#!/bin/bash
# shellcheck disable=SC1090

DEFAULT_API_URL="https://api.console.aporeto.com"

prompt () {
    local vname; vname="$1"
    local message; message="$2"
    local default; default="$3"

    echo -n "$message$( [ -n "$default" ] && echo " ($default)"): "
    read -r value
    export "$vname=${value:-$default}"
    export "$vname=${value:-$default}"
}

prompt APORETO_ACCOUNT  "Aporeto Account Name"
prompt APOCTL_NAMESPACE "Namespace"             "/$APORETO_ACCOUNT"
prompt APOCTL_API       "API URL"               "$DEFAULT_API_URL"

echo "We will now retrieve an api token."
eval "$(apoctl auth aporeto --account $APOCTL_ACCOUNT -e)"

cat << EOF > ~/.aporeto
export APORETO_ACCOUNT=$APORETO_ACCOUNT
export APOCTL_NAMESPACE=$APOCTL_NAMESPACE
export APOCTL_TOKEN=$APOCTL_TOKEN
export APOCTL_API=$APOCTL_API
EOF
