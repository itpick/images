# aws-gateway-controller-fips

AWS Application Networking is an implementation of the Kubernetes Gateway API

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#aws-gateway-controller-fips

# Load into Docker
nix build .#load-aws-gateway-controller-fips-to-docker && ./result/bin/load-aws-gateway-controller-fips-to-docker
```
