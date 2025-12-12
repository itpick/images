# opa

## Image Size

| Type | Size |
|------|------|
| Compressed | 159.59 MB |
| Uncompressed | ~398.99 MB |

## Usage

```bash
# Build the image
nix build .#opa

# Load into Docker
nix build .#load-opa-to-docker && ./result/bin/load-opa-to-docker
```
