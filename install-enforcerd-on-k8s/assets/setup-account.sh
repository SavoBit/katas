#!/bin/bash
# shellcheck disable=SC1090
set -e

clear

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

echo "Please enter your information:"
echo

prompt APORETO_ACCOUNT  "> Aporeto Account Name"
prompt APOCTL_NAMESPACE "> Namespace"             "/$APORETO_ACCOUNT"
prompt APOCTL_API       "> API URL"               "$DEFAULT_API_URL"

echo

echo "We will now retrieve an api token."
echo "Please enter your password below:"
echo
eval "> $(apoctl auth aporeto --account "$APORETO_ACCOUNT" --validity 1h -e)"

cat << EOF > ~/.aporeto
export APOCTL_NAMESPACE=$APOCTL_NAMESPACE
export APOCTL_TOKEN=$APOCTL_TOKEN
export APOCTL_API=$APOCTL_API
EOF

echo

echo "Success."
