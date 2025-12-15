# kube-arangodb

ArangoDB Kubernetes Operator for managing ArangoDB database deployments

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kube-arangodb

# Load into Docker
nix build .#load-kube-arangodb-to-docker && ./result/bin/load-kube-arangodb-to-docker
```
