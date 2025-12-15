# kubernetes-replicator

kubernetes-replicator is a custom Kubernetes controller that can be used to make secrets and config maps available in multiple namespaces

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubernetes-replicator

# Load into Docker
nix build .#load-kubernetes-replicator-to-docker && ./result/bin/load-kubernetes-replicator-to-docker
```
