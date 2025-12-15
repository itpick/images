# kubernetes-ingress-defaultbackend

Minimal image that acts as a drop-in replacement for the registry.k8s.io/defaultbackend image. Used in some ingresses like https://github.com/kubernetes/ingress-gce and https://github.com/kubernetes/ingress-nginx

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubernetes-ingress-defaultbackend

# Load into Docker
nix build .#load-kubernetes-ingress-defaultbackend-to-docker && ./result/bin/load-kubernetes-ingress-defaultbackend-to-docker
```
