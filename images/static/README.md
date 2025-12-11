# static

Base images with the minimum contents needed to run static binaries

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 33s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#static

# Load into Docker
nix build .#load-static-to-docker && ./result/bin/load-static-to-docker
```
