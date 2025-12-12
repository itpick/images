# argo-exec

## Image Size

| Type | Size |
|------|------|
| Compressed | 534.06 MB |
| Uncompressed | ~1.30 GB |

## Usage

```bash
# Build the image
nix build .#argo-exec

# Load into Docker
nix build .#load-argo-exec-to-docker && ./result/bin/load-argo-exec-to-docker
```
