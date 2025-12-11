# nginx

Minimal Wolfi-based nginx HTTP, reverse proxy, mail proxy, and a generic TCP/UDP proxy server

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#nginx

# Load into Docker
nix build .#load-nginx-to-docker && ./result/bin/load-nginx-to-docker
```
