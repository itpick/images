# kube-rbac-proxy

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 17s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 47.51 MB |
| Uncompressed | ~118.79 MB |

## Usage

```bash
# Build the image
nix build .#kube-rbac-proxy

# Load into Docker
nix build .#load-kube-rbac-proxy-to-docker && ./result/bin/load-kube-rbac-proxy-to-docker
```
