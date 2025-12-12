# argocd-image-updater

## Image Size

| Type | Size |
|------|------|
| Compressed | 533.09 MB |
| Uncompressed | ~1.30 GB |

## Usage

```bash
# Build the image
nix build .#argocd-image-updater

# Load into Docker
nix build .#load-argocd-image-updater-to-docker && ./result/bin/load-argocd-image-updater-to-docker
```
