# kubernetes-replicator-fips

kubernetes-replicator is a custom Kubernetes controller that can be used to make secrets and config maps available in multiple namespaces

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubernetes-replicator-fips

# Load into Docker
nix build .#load-kubernetes-replicator-fips-to-docker && ./result/bin/load-kubernetes-replicator-fips-to-docker
```
