# linkerd-debug

Ultralight, security-first service mesh for Kubernetes. Main repo for Linkerd 2.x

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#linkerd-debug

# Load into Docker
nix build .#load-linkerd-debug-to-docker && ./result/bin/load-linkerd-debug-to-docker
```
