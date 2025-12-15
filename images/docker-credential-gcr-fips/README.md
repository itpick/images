# docker-credential-gcr-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#docker-credential-gcr-fips

# Load into Docker
nix build .#load-docker-credential-gcr-fips-to-docker && ./result/bin/load-docker-credential-gcr-fips-to-docker
```
