# linkerd-metrics-api

Ultralight, security-first service mesh for Kubernetes. Main repo for Linkerd 2.x

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#linkerd-metrics-api

# Load into Docker
nix build .#load-linkerd-metrics-api-to-docker && ./result/bin/load-linkerd-metrics-api-to-docker
```
