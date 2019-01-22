#!/bin/bash
# shellcheck disable=SC1090

# DO NOT EDIT OUTSIDE OD /common folder

clear

DEFAULT_CLAD_URL="https://console.aporeto.com"
DEFAULT_API_URL="https://api.console.aporeto.com"
DEFAULT_HELM_REPO_URL="https://charts.aporeto.com/clients"

APORETO_NS_PREFIX="_training"
APORETO_SESSION_ID="$(uuidgen)"


prompt () {
    local vname; vname="$1"
    local message; message="$2"
    local default; default="$3"

    echo -n "$message$( [ -n "$default" ] && echo " ($default)"): "
    read -r value
    export "$vname=${value:-$default}"
}

create_ns_if_needed () {
    local parent; parent="$1"
    local ns; ns="$2"

    if [[ "$(apoctl api count ns -n "$parent" --filter "name == $parent/$ns")" == "0" ]]; then
        apoctl api create ns -n "$parent" -k name "$ns" > /dev/null || exit 1
    fi
}

## checks
if [ ! -f "/etc/APORETO_RELEASE" ]; then
    echo "Init job is still running. Please retry in a few seconds."
    exit 1
fi

## user input
echo "Aporeto Katacoda Session Configuration"
cat /etc/APORETO_RELEASE
echo
echo "This script configures the Katacoda environment"
echo "to make it point to a temporay namespace in"
echo "your Aporeto account."
echo
echo "Please enter your credentials:"
echo
prompt APORETO_ACCOUNT "Aporeto account name"

## auth
eval "$(apoctl auth aporeto --account "$APORETO_ACCOUNT" --validity 1h -e)"

## create namespace
session_namespace="/$APORETO_ACCOUNT/$APORETO_NS_PREFIX/$APORETO_SESSION_ID"
create_ns_if_needed "/$APORETO_ACCOUNT" "$APORETO_NS_PREFIX"
sleep 1
create_ns_if_needed "/$APORETO_ACCOUNT/$APORETO_NS_PREFIX" "$APORETO_SESSION_ID"

echo
echo "Katacoda training namespace is ready:"
echo
echo "  $DEFAULT_CLAD_URL/?namespace=$session_namespace"
echo

## writing source file

cat << EOF > ~/.aporeto
export APORETO_RELEASE=$(cat /etc/APORETO_RELEASE)

export DEFAULT_CLAD_URL=$DEFAULT_CLAD_URL
export DEFAULT_HELM_REPO_URL=$DEFAULT_HELM_REPO_URL

export APORETO_SESSION_ID=$APORETO_SESSION_ID
export APORETO_ACCOUNT=$APORETO_ACCOUNT
export APORETO_NAMESPACE=$session_namespace

export APOCTL_NAMESPACE=$session_namespace
export APOCTL_TOKEN=$APOCTL_TOKEN
export APOCTL_API=$DEFAULT_API_URL

alias nslink="echo \"\$DEFAULT_CLAD_URL/?namespace=\$APOCTL_NAMESPACE\""
[ -f /opt/post-setup.sh ] && source /opt/post-setup.sh
EOF
