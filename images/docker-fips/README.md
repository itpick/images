# docker-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#docker-fips

# Load into Docker
nix build .#load-docker-fips-to-docker && ./result/bin/load-docker-fips-to-docker
```
