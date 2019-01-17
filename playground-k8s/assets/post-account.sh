#!/bin/bash

alias ks="kubectl -n kube-system"
alias k="kubectl -n"

/opt/common-deploy-on-k8s.sh

echo
echo "You can check your enforcerd at:"
echo
echo "platform:  $DEFAULT_CLAD_URL/app/visualize?namespace=$KATACODA_SESSION_ID"
echo "enforcers: $DEFAULT_CLAD_URL/app/enforcers?namespace=$KATACODA_SESSION_ID"
echo "policies:  $DEFAULT_CLAD_URL/app/networkaccesspolicies?namespace=$KATACODA_SESSION_ID"
echo
