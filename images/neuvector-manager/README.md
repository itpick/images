# neuvector-manager

A Wolfi-based image for NeuVector - a full lifecycle container security platform

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 20s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#neuvector-manager

# Load into Docker
nix build .#load-neuvector-manager-to-docker && ./result/bin/load-neuvector-manager-to-docker
```
