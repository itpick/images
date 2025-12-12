# helm

Minimal image with helm binary

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 203.65 MB |
| Uncompressed | ~509.12 MB |

## Usage

```bash
# Build the image
nix build .#helm

# Load into Docker
nix build .#load-helm-to-docker && ./result/bin/load-helm-to-docker
```
