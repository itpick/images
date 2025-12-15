# pixi

Cross-platform, multi-language package manager and workflow tool built on the foundation of the conda ecosystem

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#pixi

# Load into Docker
nix build .#load-pixi-to-docker && ./result/bin/load-pixi-to-docker
```
