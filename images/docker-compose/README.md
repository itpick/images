# docker-compose

minimal docker-compose image with docker-compose binary

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 1s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#docker-compose

# Load into Docker
nix build .#load-docker-compose-to-docker && ./result/bin/load-docker-compose-to-docker
```
