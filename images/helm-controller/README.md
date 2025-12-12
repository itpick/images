# helm-controller

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 1m 5s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 190.39 MB |
| Uncompressed | ~475.98 MB |

## Usage

```bash
# Build the image
nix build .#helm-controller

# Load into Docker
nix build .#load-helm-controller-to-docker && ./result/bin/load-helm-controller-to-docker
```
