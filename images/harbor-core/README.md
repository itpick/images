# harbor-core

A Wolf-based image for Harbor - an open-source container registry with policies and RBAC, vulnerability scans, and provides trusted image signing

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 5s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#harbor-core

# Load into Docker
nix build .#load-harbor-core-to-docker && ./result/bin/load-harbor-core-to-docker
```
