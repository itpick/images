# docker-cli-buildx-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#docker-cli-buildx-fips

# Load into Docker
nix build .#load-docker-cli-buildx-fips-to-docker && ./result/bin/load-docker-cli-buildx-fips-to-docker
```
