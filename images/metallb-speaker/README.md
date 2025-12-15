# metallb-speaker

MetalLB provides network load balancers for bare-metal Kubernetes clusters

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#metallb-speaker

# Load into Docker
nix build .#load-metallb-speaker-to-docker && ./result/bin/load-metallb-speaker-to-docker
```
