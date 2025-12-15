# docker-cli-buildx

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#docker-cli-buildx

# Load into Docker
nix build .#load-docker-cli-buildx-to-docker && ./result/bin/load-docker-cli-buildx-to-docker
```
