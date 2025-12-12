# nix-tree

## Image Size

| Type | Size |
|------|------|
| Compressed | 118.24 MB |
| Uncompressed | ~295.60 MB |

## Usage

```bash
# Build the image
nix build .#nix-tree

# Load into Docker
nix build .#load-nix-tree-to-docker && ./result/bin/load-nix-tree-to-docker
```
