# docker-dind

Chainguard image for Docker in Docker (DinD), allowing you to run Docker within a container

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#docker-dind

# Load into Docker
nix build .#load-docker-dind-to-docker && ./result/bin/load-docker-dind-to-docker
```
