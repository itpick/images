# crossplane-azure-authorization

Crossplane lets you build a control plane with Kubernetes-style declarative and API-driven configuration and management for anything

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#crossplane-azure-authorization

# Load into Docker
nix build .#load-crossplane-azure-authorization-to-docker && ./result/bin/load-crossplane-azure-authorization-to-docker
```
