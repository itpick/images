# sealed-secrets-kubeseal

A Kubernetes tool that uses one-way encryption of Secrets, enabling safe GitOps-friendly secret management

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#sealed-secrets-kubeseal

# Load into Docker
nix build .#load-sealed-secrets-kubeseal-to-docker && ./result/bin/load-sealed-secrets-kubeseal-to-docker
```
