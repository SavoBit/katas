#!/bin/bash

alias ks="kubectl -n kube-system"
alias k="kubectl -n"

/opt/common-deploy-on-k8s.sh

echo
echo "Useful links:"
echo
echo "* dashboard: $DEFAULT_CLAD_URL/app/visualize?dashboard=$APOCTL_NAMESPACE"
echo "* workloads: $DEFAULT_CLAD_URL/app/visualize?namespace=$APOCTL_NAMESPACE"
echo "* enforcers: $DEFAULT_CLAD_URL/app/enforcers?namespace=$APOCTL_NAMESPACE"
echo "* policies:  $DEFAULT_CLAD_URL/app/networkaccesspolicies?namespace=$APOCTL_NAMESPACE"
echo "* networks:  $DEFAULT_CLAD_URL/app/externalservices?namespace=$APOCTL_NAMESPACE"

echo
echo "Ready."
