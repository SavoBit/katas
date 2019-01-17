#!/bin/bash
# shellcheck disable=SC1090
set -e

clear

DEFAULT_CLAD_URL="https://console.aporeto.com"
DEFAULT_API_URL="https://api.console.aporeto.com"

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
    local account; account="$1"
    local ns; ns="$2"
    if [[ "$(apoctl api count ns -n "/$account" --filter "name == /$account/$ns")" == "0" ]]; then
        apoctl api create ns -n "/$account" -k name "$ns" || exit 1
    fi
}

## user input
echo "Training Session Configuration"
echo
echo "Please enter your information:"
echo

prompt APORETO_ACCOUNT  "> Aporeto Account Name"
#prompt APOCTL_API       "> API URL"               "$DEFAULT_API_URL"

echo

echo "We will now retrieve an api token."
echo "Please enter your password below:"
echo
eval "> $(apoctl auth aporeto --account "$APORETO_ACCOUNT" --validity 1h -e)"

echo

## create namespace

session_namespace="$KATACODA_NS_PREFIX/$KATACODA_SESSION_ID"

echo "We will create a temporary namespace for this session."
echo "You can always clean things up by running 'teardown-aporeto.sh'."

echo

create_ns_if_needed "/$APORETO_ACCOUNT" "$KATACODA_NS_PREFIX"
create_ns_if_needed "/$APORETO_ACCOUNT" "$session_namespace"

echo "Katacoda session namespace is $session_namespace"
echo "You can access it via <$DEFAULT_CLAD_URL/?namespace=$session_namespace>"

echo

## writing source file

cat << EOF > ~/.aporeto
export KATACODA_SESSION_ID=$KATACODA_SESSION_ID
export APOCTL_NAMESPACE=$APOCTL_NAMESPACE
export APOCTL_TOKEN=$APOCTL_TOKEN
export APOCTL_API=$APOCTL_API
EOF
