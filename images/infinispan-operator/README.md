# infinispan-operator

Kubernetes Operator for Infinispan. Automates deployment, scaling, and lifecycle management of Infinispan distributed in-memory data grid clusters

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#infinispan-operator

# Load into Docker
nix build .#load-infinispan-operator-to-docker && ./result/bin/load-infinispan-operator-to-docker
```
