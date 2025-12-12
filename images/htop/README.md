# htop

## Image Size

| Type | Size |
|------|------|
| Compressed | 103.85 MB |
| Uncompressed | ~259.63 MB |

## Usage

```bash
# Build the image
nix build .#htop

# Load into Docker
nix build .#load-htop-to-docker && ./result/bin/load-htop-to-docker
```
