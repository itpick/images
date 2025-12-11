# python

Minimal Python image based on Wolfi

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#python

# Load into Docker
nix build .#load-python-to-docker && ./result/bin/load-python-to-docker
```
