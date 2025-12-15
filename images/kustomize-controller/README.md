# kustomize-controller

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 1s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#kustomize-controller

# Load into Docker
nix build .#load-kustomize-controller-to-docker && ./result/bin/load-kustomize-controller-to-docker
```
