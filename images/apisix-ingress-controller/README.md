# apisix-ingress-controller

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#apisix-ingress-controller

# Load into Docker
nix build .#load-apisix-ingress-controller-to-docker && ./result/bin/load-apisix-ingress-controller-to-docker
```
