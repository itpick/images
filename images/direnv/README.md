# direnv

## Image Size

| Type | Size |
|------|------|
| Compressed | 124.85 MB |
| Uncompressed | ~312.14 MB |

## Usage

```bash
# Build the image
nix build .#direnv

# Load into Docker
nix build .#load-direnv-to-docker && ./result/bin/load-direnv-to-docker
```
