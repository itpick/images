# traefik

Traefik is a cloud native application proxy

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#traefik

# Load into Docker
nix build .#load-traefik-to-docker && ./result/bin/load-traefik-to-docker
```
