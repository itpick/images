# nginx-s3-gateway-unprivileged

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nginx-s3-gateway-unprivileged

# Load into Docker
nix build .#load-nginx-s3-gateway-unprivileged-to-docker && ./result/bin/load-nginx-s3-gateway-unprivileged-to-docker
```
