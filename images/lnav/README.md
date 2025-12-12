# lnav

## Image Size

| Type | Size |
|------|------|
| Compressed | 202.08 MB |
| Uncompressed | ~505.21 MB |

## Usage

```bash
# Build the image
nix build .#lnav

# Load into Docker
nix build .#load-lnav-to-docker && ./result/bin/load-lnav-to-docker
```
