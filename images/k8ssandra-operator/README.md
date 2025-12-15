# k8ssandra-operator

The Kubernetes operator for K8ssandra

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#k8ssandra-operator

# Load into Docker
nix build .#load-k8ssandra-operator-to-docker && ./result/bin/load-k8ssandra-operator-to-docker
```
