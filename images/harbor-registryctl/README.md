# harbor-registryctl

A Wolf-based image for Harbor - an open-source container registry with policies and RBAC, vulnerability scans, and provides trusted image signing

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#harbor-registryctl

# Load into Docker
nix build .#load-harbor-registryctl-to-docker && ./result/bin/load-harbor-registryctl-to-docker
```
