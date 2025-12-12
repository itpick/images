# nfpm

## Image Size

| Type | Size |
|------|------|
| Compressed | 118.81 MB |
| Uncompressed | ~297.04 MB |

## Usage

```bash
# Build the image
nix build .#nfpm

# Load into Docker
nix build .#load-nfpm-to-docker && ./result/bin/load-nfpm-to-docker
```
