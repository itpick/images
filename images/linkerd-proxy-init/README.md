# linkerd-proxy-init

Ultralight, security-first service mesh for Kubernetes. Main repo for Linkerd 2.x

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#linkerd-proxy-init

# Load into Docker
nix build .#load-linkerd-proxy-init-to-docker && ./result/bin/load-linkerd-proxy-init-to-docker
```
