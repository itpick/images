# ingress-nginx-custom-error-pages-iamguarded

Ingress-NGINX Controller for Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#ingress-nginx-custom-error-pages-iamguarded

# Load into Docker
nix build .#load-ingress-nginx-custom-error-pages-iamguarded-to-docker && ./result/bin/load-ingress-nginx-custom-error-pages-iamguarded-to-docker
```
