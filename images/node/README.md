# node

Minimal container image for running NodeJS apps

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 5s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 812.40 MB |
| Uncompressed | ~1.98 GB |

## Usage

```bash
# Build the image
nix build .#node

# Load into Docker
nix build .#load-node-to-docker && ./result/bin/load-node-to-docker
```
