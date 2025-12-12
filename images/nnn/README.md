# nnn

## Image Size

| Type | Size |
|------|------|
| Compressed | 110.36 MB |
| Uncompressed | ~275.90 MB |

## Usage

```bash
# Build the image
nix build .#nnn

# Load into Docker
nix build .#load-nnn-to-docker && ./result/bin/load-nnn-to-docker
```
