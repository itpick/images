# harbor-portal-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#harbor-portal-fips

# Load into Docker
nix build .#load-harbor-portal-fips-to-docker && ./result/bin/load-harbor-portal-fips-to-docker
```
