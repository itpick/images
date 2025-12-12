# calico-cni

## Image Size

| Type | Size |
|------|------|
| Compressed | 336.12 MB |
| Uncompressed | ~840.30 MB |

## Usage

```bash
# Build the image
nix build .#calico-cni

# Load into Docker
nix build .#load-calico-cni-to-docker && ./result/bin/load-calico-cni-to-docker
```
