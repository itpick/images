# trust-manager

Minimalist Wolfi-based trust-manager operator for distributing trust bundles across a Kubernetes cluster

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 5s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#trust-manager

# Load into Docker
nix build .#load-trust-manager-to-docker && ./result/bin/load-trust-manager-to-docker
```
