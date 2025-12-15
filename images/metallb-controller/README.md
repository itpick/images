# metallb-controller

MetalLB provides network load balancers for bare-metal Kubernetes clusters

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#metallb-controller

# Load into Docker
nix build .#load-metallb-controller-to-docker && ./result/bin/load-metallb-controller-to-docker
```
