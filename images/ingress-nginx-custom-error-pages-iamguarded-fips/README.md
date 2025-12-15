# ingress-nginx-custom-error-pages-iamguarded-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#ingress-nginx-custom-error-pages-iamguarded-fips

# Load into Docker
nix build .#load-ingress-nginx-custom-error-pages-iamguarded-fips-to-docker && ./result/bin/load-ingress-nginx-custom-error-pages-iamguarded-fips-to-docker
```
