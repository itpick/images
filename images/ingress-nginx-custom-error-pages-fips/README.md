# ingress-nginx-custom-error-pages-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#ingress-nginx-custom-error-pages-fips

# Load into Docker
nix build .#load-ingress-nginx-custom-error-pages-fips-to-docker && ./result/bin/load-ingress-nginx-custom-error-pages-fips-to-docker
```
