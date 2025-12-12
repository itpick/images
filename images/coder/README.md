# coder

## Image Size

| Type | Size |
|------|------|
| Compressed | 705.55 MB |
| Uncompressed | ~1.72 GB |

## Usage

```bash
# Build the image
nix build .#coder

# Load into Docker
nix build .#load-coder-to-docker && ./result/bin/load-coder-to-docker
```
