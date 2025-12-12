# eza

## Image Size

| Type | Size |
|------|------|
| Compressed | 104.79 MB |
| Uncompressed | ~261.97 MB |

## Usage

```bash
# Build the image
nix build .#eza

# Load into Docker
nix build .#load-eza-to-docker && ./result/bin/load-eza-to-docker
```
