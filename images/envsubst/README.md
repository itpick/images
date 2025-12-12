# envsubst

## Image Size

| Type | Size |
|------|------|
| Compressed | 53.77 MB |
| Uncompressed | ~134.43 MB |

## Usage

```bash
# Build the image
nix build .#envsubst

# Load into Docker
nix build .#load-envsubst-to-docker && ./result/bin/load-envsubst-to-docker
```
