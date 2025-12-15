# crossplane-azure

Crossplane lets you build a control plane with Kubernetes-style declarative and API-driven configuration and management for anything

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#crossplane-azure

# Load into Docker
nix build .#load-crossplane-azure-to-docker && ./result/bin/load-crossplane-azure-to-docker
```
