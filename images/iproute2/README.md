# iproute2

## Image Size

| Type | Size |
|------|------|
| Compressed | 147.52 MB |
| Uncompressed | ~368.82 MB |

## Usage

```bash
# Build the image
nix build .#iproute2

# Load into Docker
nix build .#load-iproute2-to-docker && ./result/bin/load-iproute2-to-docker
```
