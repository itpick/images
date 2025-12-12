# kustomize-controller

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 1m 20s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 199.21 MB |
| Uncompressed | ~498.03 MB |

## Usage

```bash
# Build the image
nix build .#kustomize-controller

# Load into Docker
nix build .#load-kustomize-controller-to-docker && ./result/bin/load-kustomize-controller-to-docker
```
