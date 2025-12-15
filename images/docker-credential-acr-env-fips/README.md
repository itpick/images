# docker-credential-acr-env-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#docker-credential-acr-env-fips

# Load into Docker
nix build .#load-docker-credential-acr-env-fips-to-docker && ./result/bin/load-docker-credential-acr-env-fips-to-docker
```
