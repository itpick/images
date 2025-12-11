# crossplane

Crossplane lets you build a control plane with Kubernetes-style declarative and API-driven configuration and management for anything

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2m 11s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#crossplane

# Load into Docker
nix build .#load-crossplane-to-docker && ./result/bin/load-crossplane-to-docker
```
