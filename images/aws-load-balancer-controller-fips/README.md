# aws-load-balancer-controller-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#aws-load-balancer-controller-fips

# Load into Docker
nix build .#load-aws-load-balancer-controller-fips-to-docker && ./result/bin/load-aws-load-balancer-controller-fips-to-docker
```
