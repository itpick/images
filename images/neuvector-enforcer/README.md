# neuvector-enforcer

A Wolfi-based image for NeuVector - a full lifecycle container security platform

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#neuvector-enforcer

# Load into Docker
nix build .#load-neuvector-enforcer-to-docker && ./result/bin/load-neuvector-enforcer-to-docker
```
