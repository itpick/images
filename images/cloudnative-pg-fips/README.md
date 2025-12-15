# cloudnative-pg-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cloudnative-pg-fips

# Load into Docker
nix build .#load-cloudnative-pg-fips-to-docker && ./result/bin/load-cloudnative-pg-fips-to-docker
```
