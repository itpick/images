# postgres-cloudnative-pg-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#postgres-cloudnative-pg-fips

# Load into Docker
nix build .#load-postgres-cloudnative-pg-fips-to-docker && ./result/bin/load-postgres-cloudnative-pg-fips-to-docker
```
