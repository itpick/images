# aws-load-balancer-controller

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#aws-load-balancer-controller

# Load into Docker
nix build .#load-aws-load-balancer-controller-to-docker && ./result/bin/load-aws-load-balancer-controller-to-docker
```
