# calico-typha

## Image Size

| Type | Size |
|------|------|
| Compressed | 283.20 MB |
| Uncompressed | ~708.02 MB |

## Usage

```bash
# Build the image
nix build .#calico-typha

# Load into Docker
nix build .#load-calico-typha-to-docker && ./result/bin/load-calico-typha-to-docker
```
