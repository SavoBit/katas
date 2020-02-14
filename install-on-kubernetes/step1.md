Use the following command to configure the enforcers in your cluster to ignore loopback traffic, allowing sidecar containers to communicate with each other.

```
cat <<'EOF' | apoctl api import -n $APOCTL_NAMESPACE -f -
label: kubernetes-default-enforcerprofile
data:
  enforcerprofiles:
  - name: kubernetes-default
    metadata:
    - '@profile:name=kubernetes-default'
    description: Default Profile for Kubernetes
    excludedNetworks:
    - 127.0.0.0/8
    ignoreExpression:
    - - '@app:k8s:namespace=aporeto'
    - - '@app:k8s:namespace=aporeto-operator'
    - - '@app:k8s:namespace=kube-system'
    excludedInterfaces: []
    targetNetworks: []
    targetUDPNetworks: []
  enforcerprofilemappingpolicies:
  - name: fallback-kubernetes-default
    fallback: true
    description: "Kubernetes fallback: if there is no other profile, use the default Kubernetes profile."
    object:
    - - '@profile:name=kubernetes-default'
    subject:
    - - $identity=enforcer
EOF
```