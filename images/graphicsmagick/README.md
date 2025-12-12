# graphicsmagick

## Image Size

| Type | Size |
|------|------|
| Compressed | 369.68 MB |
| Uncompressed | ~924.20 MB |

## Usage

```bash
# Build the image
nix build .#graphicsmagick

# Load into Docker
nix build .#load-graphicsmagick-to-docker && ./result/bin/load-graphicsmagick-to-docker
```
