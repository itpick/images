# harbor-core-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#harbor-core-fips

# Load into Docker
nix build .#load-harbor-core-fips-to-docker && ./result/bin/load-harbor-core-fips-to-docker
```
