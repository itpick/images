# nginx-iamguarded

Minimal Wolfi-based nginx HTTP, reverse proxy, mail proxy, and a generic TCP/UDP proxy server

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nginx-iamguarded

# Load into Docker
nix build .#load-nginx-iamguarded-to-docker && ./result/bin/load-nginx-iamguarded-to-docker
```
