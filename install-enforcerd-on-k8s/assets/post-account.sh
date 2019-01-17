#!/bin/bash

echo "Waiting for Kubernetes to start (this can take a minute or two)..."
while ! kubectl version > /dev/null 2>&1; do sleep 1; done
echo "OK"
echo

helm init > /dev/null 2>&1
helm repo add aporeto https://charts.aporeto.com/_unstable/clients > /dev/null 2>&1

echo "Waiting for helm to be ready..."
while ! helm version > /dev/null 2>&1; do sleep 1; done
echo "OK"
echo
