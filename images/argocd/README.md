# argocd

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 9s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 1023.78 MB |
| Uncompressed | ~2.49 GB |

## Usage

```bash
# Build the image
nix build .#argocd

# Load into Docker
nix build .#load-argocd-to-docker && ./result/bin/load-argocd-to-docker
```
