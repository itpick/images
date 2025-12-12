# kustomize

## Image Size

| Type | Size |
|------|------|
| Compressed | 132.18 MB |
| Uncompressed | ~330.46 MB |

## Usage

```bash
# Build the image
nix build .#kustomize

# Load into Docker
nix build .#load-kustomize-to-docker && ./result/bin/load-kustomize-to-docker
```
