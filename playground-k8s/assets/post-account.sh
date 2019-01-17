#!/bin/bash

alias ks="kubectl -n kube-system"
alias k="kubectl -n"

/opt/common-deploy-on-k8s.sh

echo
echo "You can check your enforcerd at:"
echo
echo "platform:  $DEFAULT_CLAD_URL/app/visualize?namespace=$APOCTL_NAMESPACE"
echo "enforcers: $DEFAULT_CLAD_URL/app/enforcers?namespace=$APOCTL_NAMESPACE"
echo "policies:  $DEFAULT_CLAD_URL/app/networkaccesspolicies?namespace=$APOCTL_NAMESPACE"
echo
