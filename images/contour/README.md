# contour

Contour is an ingress controller for Kubernetes that works by deploying the Envoy proxy as a reverse proxy and load balancer. Contour supports dynamic configuration updates out of the box while maintaining a lightweight profile

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 156.75 MB |
| Uncompressed | ~391.88 MB |

## Usage

```bash
# Build the image
nix build .#contour

# Load into Docker
nix build .#load-contour-to-docker && ./result/bin/load-contour-to-docker
```
