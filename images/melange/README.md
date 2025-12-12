# melange

## Image Size

| Type | Size |
|------|------|
| Compressed | 153.60 MB |
| Uncompressed | ~384.02 MB |

## Usage

```bash
# Build the image
nix build .#melange

# Load into Docker
nix build .#load-melange-to-docker && ./result/bin/load-melange-to-docker
```
