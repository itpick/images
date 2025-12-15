# kube-rbac-proxy

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#kube-rbac-proxy

# Load into Docker
nix build .#load-kube-rbac-proxy-to-docker && ./result/bin/load-kube-rbac-proxy-to-docker
```
