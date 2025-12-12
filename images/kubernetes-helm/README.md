# kubernetes-helm

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 146.47 MB |
| Uncompressed | ~366.19 MB |

## Usage

```bash
# Build the image
nix build .#kubernetes-helm

# Load into Docker
nix build .#load-kubernetes-helm-to-docker && ./result/bin/load-kubernetes-helm-to-docker
```
