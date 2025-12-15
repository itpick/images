# chainguard-base

Minimal image useful as a base for building secure images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#chainguard-base

# Load into Docker
nix build .#load-chainguard-base-to-docker && ./result/bin/load-chainguard-base-to-docker
```
