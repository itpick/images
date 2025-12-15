# docker-init-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#docker-init-fips

# Load into Docker
nix build .#load-docker-init-fips-to-docker && ./result/bin/load-docker-init-fips-to-docker
```
