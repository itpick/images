# ingress-nginx-controller

Ingress-NGINX Controller for Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#ingress-nginx-controller

# Load into Docker
nix build .#load-ingress-nginx-controller-to-docker && ./result/bin/load-ingress-nginx-controller-to-docker
```
