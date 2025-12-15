# neuvector-updater

A Wolfi-based image for NeuVector - a full lifecycle container security platform

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#neuvector-updater

# Load into Docker
nix build .#load-neuvector-updater-to-docker && ./result/bin/load-neuvector-updater-to-docker
```
