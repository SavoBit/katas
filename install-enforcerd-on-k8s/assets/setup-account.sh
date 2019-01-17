#!/bin/bash
# shellcheck disable=SC1090
set -e

clear

DEFAULT_CLAD_URL="https://console.aporeto.com"
# DEFAULT_API_URL="https://api.console.aporeto.com"

KATACODA_NS_PREFIX="_training"
KATACODA_SESSION_ID="$(uuidgen)"

prompt () {
    local vname; vname="$1"
    local message; message="$2"
    local default; default="$3"

    echo -n "$message$( [ -n "$default" ] && echo " ($default)"): "
    read -r value
    export "$vname=${value:-$default}"
    export "$vname=${value:-$default}"
}

create_ns_if_needed () {
    local parent; parent="$1"
    local ns; ns="$2"

    if [[ "$(apoctl api count ns -n "$parent" --filter "name == $parent/$ns")" == "0" ]]; then
        apoctl api create ns -n "$parent" -k name "$ns" || exit 1
    fi
}

## user input
echo "Aporeto Katacoda Session Configuration"
echo
echo "This script configures the Katacoda environment"
echo "to make it point to a temporay namespace in"
echo "your Aporeto account."
echo
echo "Please enter your credentials:"
echo
prompt APORETO_ACCOUNT  "Aporeto account name"
eval "$(apoctl auth aporeto --account "$APORETO_ACCOUNT" --validity 1h -e)"
echo

## create namespace
session_namespace="/$APORETO_ACCOUNT/$KATACODA_NS_PREFIX/$KATACODA_SESSION_ID"
echo "> Creating session namespaces..."
create_ns_if_needed "/$APORETO_ACCOUNT" "$KATACODA_NS_PREFIX"
sleep 1
create_ns_if_needed "/$APORETO_ACCOUNT/$KATACODA_NS_PREFIX" "$KATACODA_SESSION_ID"

echo
echo "Katacoda session is ready. The namespace for this session is :"
echo
echo "  $session_namespace"
echo
echo "apoctl is pointing to this namespace and UI url is:"
echo
echo "  $DEFAULT_CLAD_URL/?namespace=$session_namespace"
echo

## writing source file

cat << EOF > ~/.aporeto
export APOCTL_NAMESPACE=$session_namespace
export APOCTL_TOKEN=$APOCTL_TOKEN
export APOCTL_API=$APOCTL_API

echo "Waiting for Kubernetes to start (this can take a minute or two)..."
while ! kubectl version > /dev/null 2>&1; do sleep 1; done

echo "Waiting for helm to be ready..."
while ! helm version > /dev/null 2>&1; do sleep 1; done
EOF
