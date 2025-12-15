# helm

Minimal image with helm binary

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#helm

# Load into Docker
nix build .#load-helm-to-docker && ./result/bin/load-helm-to-docker
```
