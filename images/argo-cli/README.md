# argo-cli

## Image Size

| Type | Size |
|------|------|
| Compressed | 523.39 MB |
| Uncompressed | ~1.27 GB |

## Usage

```bash
# Build the image
nix build .#argo-cli

# Load into Docker
nix build .#load-argo-cli-to-docker && ./result/bin/load-argo-cli-to-docker
```
