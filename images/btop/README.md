# btop

## Image Size

| Type | Size |
|------|------|
| Compressed | 103.30 MB |
| Uncompressed | ~258.25 MB |

## Usage

```bash
# Build the image
nix build .#btop

# Load into Docker
nix build .#load-btop-to-docker && ./result/bin/load-btop-to-docker
```
