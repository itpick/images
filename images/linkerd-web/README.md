# linkerd-web

Ultralight, security-first service mesh for Kubernetes. Main repo for Linkerd 2.x

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#linkerd-web

# Load into Docker
nix build .#load-linkerd-web-to-docker && ./result/bin/load-linkerd-web-to-docker
```
