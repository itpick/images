# contour-iamguarded

Contour is an ingress controller for Kubernetes that works by deploying the Envoy proxy as a reverse proxy and load balancer. Contour supports dynamic configuration updates out of the box while maintaining a lightweight profile

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#contour-iamguarded

# Load into Docker
nix build .#load-contour-iamguarded-to-docker && ./result/bin/load-contour-iamguarded-to-docker
```
