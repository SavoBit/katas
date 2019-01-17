#!/bin/bash
# shellcheck disable=SC1090

# DO NOT EDIT OUTSIDE OD /common folder

echo "Waiting for Kubernetes to stabilize..."
while ! kubectl version > /dev/null 2>&1; do sleep 1; done
echo "* api: OK"

helm init > /dev/null 2>&1
helm repo add aporeto https://charts.aporeto.com/_unstable/clients > /dev/null 2>&1

while ! helm version > /dev/null 2>&1; do sleep 1; done
echo "* helm: OK"

echo
echo "Deploying Aporeto..."
apoctl appcred create aporeto-operator \
  --role @auth:role=aporeto-operator \
  --type k8s | kubectl apply -f - -n kube-system > /dev/null || exit 1
echo "* aporeto-operator appcreds: OK"

apoctl appcred create enforcerd \
  --role @auth:role=enforcer \
  --type k8s | kubectl apply -f - -n kube-system > /dev/null || exit 1
echo "* enforcerd appcreds: OK"

helm install \
    --name aporeto-operator \
    --namespace kube-system \
    aporeto/aporeto-operator > /dev/null || exit 1
echo "* aporeto-operator deployed: OK"

# TODO: wait until helm ls

helm install \
    --name enforcerd \
    --namespace kube-system \
    aporeto/enforcerd > /dev/null || exit 1
echo "* enforcerd deployed: OK"
