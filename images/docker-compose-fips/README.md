# docker-compose-fips

minimal docker-compose image with docker-compose binary

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#docker-compose-fips

# Load into Docker
nix build .#load-docker-compose-fips-to-docker && ./result/bin/load-docker-compose-fips-to-docker
```
