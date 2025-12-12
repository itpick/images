# imagemagick

## Image Size

| Type | Size |
|------|------|
| Compressed | 250.80 MB |
| Uncompressed | ~627.01 MB |

## Usage

```bash
# Build the image
nix build .#imagemagick

# Load into Docker
nix build .#load-imagemagick-to-docker && ./result/bin/load-imagemagick-to-docker
```
