# docker-dind-fips

Chainguard image for Docker in Docker (DinD), allowing you to run Docker within a container

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#docker-dind-fips

# Load into Docker
nix build .#load-docker-dind-fips-to-docker && ./result/bin/load-docker-dind-fips-to-docker
```
