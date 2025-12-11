# harbor-jobservice

A Wolf-based image for Harbor - an open-source container registry with policies and RBAC, vulnerability scans, and provides trusted image signing

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 6s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#harbor-jobservice

# Load into Docker
nix build .#load-harbor-jobservice-to-docker && ./result/bin/load-harbor-jobservice-to-docker
```
