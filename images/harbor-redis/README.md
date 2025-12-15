# harbor-redis

A Wolf-based image for Harbor - an open-source container registry with policies and RBAC, vulnerability scans, and provides trusted image signing

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#harbor-redis

# Load into Docker
nix build .#load-harbor-redis-to-docker && ./result/bin/load-harbor-redis-to-docker
```
