# az

## Image Size

| Type | Size |
|------|------|
| Compressed | 1.54 GB |
| Uncompressed | ~3.85 GB |

## Usage

```bash
# Build the image
nix build .#az

# Load into Docker
nix build .#load-az-to-docker && ./result/bin/load-az-to-docker
```
