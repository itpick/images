# ingress-nginx-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#ingress-nginx-fips

# Load into Docker
nix build .#load-ingress-nginx-fips-to-docker && ./result/bin/load-ingress-nginx-fips-to-docker
```
