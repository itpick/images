# buildkit

Buildkit is a concurrent, cache-efficient, and Dockerfile-agnostic builder toolkit

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#buildkit

# Load into Docker
nix build .#load-buildkit-to-docker && ./result/bin/load-buildkit-to-docker
```
