# harbor-portal

A Wolf-based image for Harbor - an open-source container registry with policies and RBAC, vulnerability scans, and provides trusted image signing

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 58.58 MB |
| Uncompressed | ~146.46 MB |

## Usage

```bash
# Build the image
nix build .#harbor-portal

# Load into Docker
nix build .#load-harbor-portal-to-docker && ./result/bin/load-harbor-portal-to-docker
```
