# kube-oidc-proxy

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kube-oidc-proxy

# Load into Docker
nix build .#load-kube-oidc-proxy-to-docker && ./result/bin/load-kube-oidc-proxy-to-docker
```
