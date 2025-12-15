# aws-gateway-controller

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#aws-gateway-controller

# Load into Docker
nix build .#load-aws-gateway-controller-to-docker && ./result/bin/load-aws-gateway-controller-to-docker
```
