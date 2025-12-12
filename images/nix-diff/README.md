# nix-diff

## Image Size

| Type | Size |
|------|------|
| Compressed | 109.88 MB |
| Uncompressed | ~274.72 MB |

## Usage

```bash
# Build the image
nix build .#nix-diff

# Load into Docker
nix build .#load-nix-diff-to-docker && ./result/bin/load-nix-diff-to-docker
```
