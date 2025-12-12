# caddy

Open source web server with automatic HTTPS written in Go

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 114.08 MB |
| Uncompressed | ~285.21 MB |

## Usage

```bash
# Build the image
nix build .#caddy

# Load into Docker
nix build .#load-caddy-to-docker && ./result/bin/load-caddy-to-docker
```
