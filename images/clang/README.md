# clang

## Image Size

| Type | Size |
|------|------|
| Compressed | 1.80 GB |
| Uncompressed | ~4.50 GB |

## Usage

```bash
# Build the image
nix build .#clang

# Load into Docker
nix build .#load-clang-to-docker && ./result/bin/load-clang-to-docker
```
