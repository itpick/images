# multus-cni

## Image Size

| Type | Size |
|------|------|
| Compressed | 278.55 MB |
| Uncompressed | ~696.39 MB |

## Usage

```bash
# Build the image
nix build .#multus-cni

# Load into Docker
nix build .#load-multus-cni-to-docker && ./result/bin/load-multus-cni-to-docker
```
