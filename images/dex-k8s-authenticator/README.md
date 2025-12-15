# dex-k8s-authenticator

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#dex-k8s-authenticator

# Load into Docker
nix build .#load-dex-k8s-authenticator-to-docker && ./result/bin/load-dex-k8s-authenticator-to-docker
```
