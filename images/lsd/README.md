# lsd

## Image Size

| Type | Size |
|------|------|
| Compressed | 107.98 MB |
| Uncompressed | ~269.95 MB |

## Usage

```bash
# Build the image
nix build .#lsd

# Load into Docker
nix build .#load-lsd-to-docker && ./result/bin/load-lsd-to-docker
```
