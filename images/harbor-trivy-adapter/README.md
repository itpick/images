# harbor-trivy-adapter

A Wolf-based image for Harbor - an open-source container registry with policies and RBAC, vulnerability scans, and provides trusted image signing

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#harbor-trivy-adapter

# Load into Docker
nix build .#load-harbor-trivy-adapter-to-docker && ./result/bin/load-harbor-trivy-adapter-to-docker
```
