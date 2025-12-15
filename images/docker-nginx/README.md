# docker-nginx

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#docker-nginx

# Load into Docker
nix build .#load-docker-nginx-to-docker && ./result/bin/load-docker-nginx-to-docker
```
