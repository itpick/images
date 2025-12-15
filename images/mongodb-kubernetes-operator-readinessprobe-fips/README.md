# mongodb-kubernetes-operator-readinessprobe-fips

Chainguard's MongoDB Kubernetes Operator image enables you to deploy a MongoDB community instance to a Kubernetes cluster, as well as support replica sets, scaling the replicas up or down, version upgrades, custom roles, and TLS security

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#mongodb-kubernetes-operator-readinessprobe-fips

# Load into Docker
nix build .#load-mongodb-kubernetes-operator-readinessprobe-fips-to-docker && ./result/bin/load-mongodb-kubernetes-operator-readinessprobe-fips-to-docker
```
