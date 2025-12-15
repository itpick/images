# docker-cli-fips

Minimal Docker CLI container image

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#docker-cli-fips

# Load into Docker
nix build .#load-docker-cli-fips-to-docker && ./result/bin/load-docker-cli-fips-to-docker
```
