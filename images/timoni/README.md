# timoni

Minimal image with timoni binary. timoni is a package manager for Kubernetes, powered by cue and inspired by helm

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#timoni

# Load into Docker
nix build .#load-timoni-to-docker && ./result/bin/load-timoni-to-docker
```
