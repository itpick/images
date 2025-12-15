# keda

Minimal image with the Keda binary

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#keda

# Load into Docker
nix build .#load-keda-to-docker && ./result/bin/load-keda-to-docker
```
