# crossplane-azure-sql

Crossplane lets you build a control plane with Kubernetes-style declarative and API-driven configuration and management for anything

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#crossplane-azure-sql

# Load into Docker
nix build .#load-crossplane-azure-sql-to-docker && ./result/bin/load-crossplane-azure-sql-to-docker
```
