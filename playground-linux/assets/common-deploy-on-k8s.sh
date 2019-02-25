#!/bin/bash
# shellcheck disable=SC1090

# DO NOT EDIT OUTSIDE OD /common folder

echo "Waiting for Kubernetes to stabilize..."
while ! kubectl version > /dev/null 2>&1; do sleep 1; done
echo "* api: OK"

helm init > /dev/null 2>&1 || exit 1
helm repo remove aporeto > /dev/null 2>&1
helm repo add aporeto "$DEFAULT_HELM_REPO_URL" > /dev/null 2>&1 || exit 1

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

kubectl create namespace aporeto

helm install \
    --name aporeto-crds\
    aporeto/aporeto-crds

helm install \
    --name aporeto-operator \
    --namespace aporeto \
    aporeto/aporeto-operator > /dev/null || exit 1
echo "* aporeto-operator deployed: OK"

# TODO: wait until helm ls

helm install \
    --name enforcerd \
    --namespace aporeto \
    aporeto/enforcerd > /dev/null || exit 1
echo "* enforcerd deployed: OK"
