# haproxy-ingress

Kubernetes ingress controller implementation for HAProxy

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#haproxy-ingress

# Load into Docker
nix build .#load-haproxy-ingress-to-docker && ./result/bin/load-haproxy-ingress-to-docker
```
