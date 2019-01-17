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
echo "Training Session Configuration"
echo
echo "Please enter your information:"
echo

prompt APORETO_ACCOUNT  "> Aporeto account name"
eval "$(apoctl auth aporeto --account "$APORETO_ACCOUNT" --validity 1h -e)"

echo

## create namespace
session_namespace="/$APORETO_ACCOUNT/$KATACODA_NS_PREFIX/$KATACODA_SESSION_ID"

create_ns_if_needed "/$APORETO_ACCOUNT" "$KATACODA_NS_PREFIX"
create_ns_if_needed "/$APORETO_ACCOUNT/$KATACODA_NS_PREFIX" "$KATACODA_SESSION_ID"

echo

echo "Ready."

echo "Katacoda session namespace is $session_namespace"
echo "apoctl is configured, and UI url is:"

echo

echo "  $DEFAULT_CLAD_URL/?namespace=$session_namespace"

## writing source file

cat << EOF > ~/.aporeto
export APOCTL_NAMESPACE=$session_namespace
export APOCTL_TOKEN=$APOCTL_TOKEN
export APOCTL_API=$APOCTL_API
EOF
