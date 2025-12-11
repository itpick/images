# neuvector-controller

A Wolfi-based image for NeuVector - a full lifecycle container security platform

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#neuvector-controller

# Load into Docker
nix build .#load-neuvector-controller-to-docker && ./result/bin/load-neuvector-controller-to-docker
```
