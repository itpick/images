# kubernetes-secret-generator

Kubernetes controller for automatically generating and updating secrets

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubernetes-secret-generator

# Load into Docker
nix build .#load-kubernetes-secret-generator-to-docker && ./result/bin/load-kubernetes-secret-generator-to-docker
```
